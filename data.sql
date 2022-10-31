CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "author" varchar,
  "text" varchar,
  "id_tgs" int,
  "id_ref" int
);

CREATE TABLE "tags" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "comment" varchar
);

CREATE TABLE "rel_user_comment" (
  "id" SERIAL PRIMARY KEY,
  "id_user" int,
  "id_comment" int
);

ALTER TABLE "rel_user_comment" ADD FOREIGN KEY ("id_user") REFERENCES "user" ("id");

ALTER TABLE "rel_user_comment" ADD FOREIGN KEY ("id_comment") REFERENCES "comments" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_tgs") REFERENCES "tags" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_ref") REFERENCES "rel_user_comment" ("id");

insert into "user" (name, email, password, age) values ('Diana', 'diana@gmail.com', 123, 19),
('Daniel', 'daniel@gmail.com', 321, 18);

insert into "tags" (name) values ('Filosofía'),('Mascotas'),('Belleza');

insert into "comments" (comment) values ('¡Que bonito!'), ('¡Que buen pots!'), ('Me encanto'), ('Es super genial');

insert into "rel_user_comment" (id_user, id_comment) values (2,1), (1,2), (1,3), (2,4),(1,5);

insert into "posts" (title, description, author, text, id_tgs, id_ref) values 
('datos curiosos', 'frases mas conocidas del mundo medieval','Sócrates', 'lorem', 1, 6), 
('peluditos', '7 tips para que tu mascota se comporte mejor','Estrellita777', 'lorem',2,7);