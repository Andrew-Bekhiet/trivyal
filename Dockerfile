FROM debian:latest AS build

RUN apt-get update && apt-get -y install curl git unzip xz-utils zip libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:${PATH}"

WORKDIR /app
COPY . .

WORKDIR /app/trivyal_flutter/

RUN flutter build web && cp -r ./build/web/* ../trivyal_server/web/static/

WORKDIR /app/trivyal_server

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