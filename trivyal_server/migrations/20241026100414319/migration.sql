BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "questions" DROP CONSTRAINT "questions_fk_1";
ALTER TABLE "questions" DROP COLUMN "_gamesQuestionsGamesId";

--
-- MIGRATION VERSION FOR trivyal
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trivyal', '20241026100414319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241026100414319', "timestamp" = now();

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
