DROP TABLE IF EXISTS "public"."recipes";

CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

CREATE TABLE "public"."recipes" (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time int,
  rating int
);

INSERT INTO "public"."recipes" ("id", "name", "cooking_time", "rating") VALUES
(1, 'Tofu', 10, 4),
(2, 'Dim Sum', 30, 3),
(3, 'Fried Rice', 20, 5);
