BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "games" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "ownerId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "questions" (
    "id" bigserial PRIMARY KEY,
    "gameId" bigint NOT NULL,
    "text" text NOT NULL,
    "choices" json NOT NULL,
    "correctChoice" json NOT NULL,
    "timeInSeconds" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "games"
    ADD CONSTRAINT "games_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "questions"
    ADD CONSTRAINT "questions_fk_0"
    FOREIGN KEY("gameId")
    REFERENCES "games"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR trivyal
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trivyal', '20241021155134080', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241021155134080', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
