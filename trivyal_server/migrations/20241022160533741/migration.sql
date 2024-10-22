BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "users" CASCADE;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "games" DROP CONSTRAINT "games_fk_0";
ALTER TABLE ONLY "games"
    ADD CONSTRAINT "games_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION DROP TABLE
--
DROP TABLE "questions" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "questions" (
    "id" bigserial PRIMARY KEY,
    "gameId" bigint NOT NULL,
    "text" text NOT NULL,
    "choices" json NOT NULL,
    "correctChoiceId" bigint NOT NULL,
    "timeInSeconds" bigint NOT NULL,
    "_gamesQuestionsGamesId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "questions"
    ADD CONSTRAINT "questions_fk_0"
    FOREIGN KEY("gameId")
    REFERENCES "games"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "questions"
    ADD CONSTRAINT "questions_fk_1"
    FOREIGN KEY("_gamesQuestionsGamesId")
    REFERENCES "games"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR trivyal
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trivyal', '20241022160533741', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241022160533741', "timestamp" = now();

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
