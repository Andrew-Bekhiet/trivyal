FROM dart:stable AS build

WORKDIR /server
COPY trivyal_server .

ARG CONFIG_GOOGLE_CLIENT_SECRET
ARG CONFIG_PASSWORDS_YAML

RUN echo $CONFIG_GOOGLE_CLIENT_SECRET | base64 -d > ./config/google_client_secret.json
RUN echo $CONFIG_PASSWORDS_YAML | base64 -d > ./config/passwords.yaml

RUN dart pub get
RUN dart compile exe bin/main.dart -o bin/server

WORKDIR /web
COPY trivyal_flutter/ .
COPY trivyal_client/ ../trivyal_client/

RUN apt-get update && apt-get -y install curl git unzip xz-utils zip libglu1-mesa
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="${PATH}:/usr/local/flutter/bin"

ARG UTILS_SECRETS_DART

RUN echo $UTILS_SECRETS_DART | base64 -d > ./lib/utils/secrets.dart

RUN flutter pub get
RUN flutter build web

FROM alpine:latest

ENV runmode=production
ENV serverid=default
ENV logging=normal
ENV role=monolith

COPY --from=build /runtime/ /
COPY --from=build /server/bin/server server
COPY --from=build /server/confi[g]/ config/
COPY --from=build /server/we[b]/ web/
COPY --from=build /server/migration[s]/ migrations/

COPY --from=build /web/build/web/ web/

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ./server --mode=$runmode --server-id=$serverid --logging=$logging --role=$role
