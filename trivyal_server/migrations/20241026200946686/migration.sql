BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "live_games" (
    "id" bigserial PRIMARY KEY,
    "pin" bigint NOT NULL,
    "gameId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "pin_idx" ON "live_games" USING btree ("pin");
CREATE UNIQUE INDEX "gameId_idx" ON "live_games" USING btree ("gameId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "live_games"
    ADD CONSTRAINT "live_games_fk_0"
    FOREIGN KEY("gameId")
    REFERENCES "games"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR trivyal
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('trivyal', '20241026200946686', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241026200946686', "timestamp" = now();

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
