FROM debian:latest AS build

RUN apt-get update && apt-get -y install curl git unzip xz-utils zip libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:${PATH}"

WORKDIR /app
COPY . .

WORKDIR /app/trivyal_flutter/

RUN echo $UTILS_SECRETS_DART | base64 -d > ./lib/utils/secrets.dart

RUN flutter build web 
RUN mkdir -p ../trivyal_server/web
RUN cp -r ./build/web/* ../trivyal_server/web/

WORKDIR /app/trivyal_server

RUN echo $CONFIG_GOOGLE_CLIENT_SECRET | base64 -d > ./config/google_client_secret.json
RUN echo $CONFIG_PASSWORDS_YAML | base64 -d > ./config/passwords.yaml

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

FROM alpine:latest

ENV runmode=production
ENV serverid=default
ENV logging=normal
ENV role=monolith

COPY --from=build /runtime/ /
COPY --from=build /app/trivyal_server/bin/server server
COPY --from=build /app/trivyal_server/confi[g]/ config/
COPY --from=build /app/trivyal_server/we[b]/ web/
COPY --from=build /app/trivyal_server/migration[s]/ migrations/

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ./server --mode=$runmode --server-id=$serverid --logging=$logging --role=$role
