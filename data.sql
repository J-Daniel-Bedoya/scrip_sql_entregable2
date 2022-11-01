CREATE TABLE "posts" (
  "id_post" SERIAL PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "author" varchar,
  "text" varchar,
  "id_tags" int NOT NULL,
  "id_user_comment" int NOT NULL
);

CREATE TABLE "user" (
  "id_user" SERIAL PRIMARY KEY,
  "name" varchar,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "tags" (
  "id_tags" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "comments" (
  "id_comment" SERIAL PRIMARY KEY,
  "comment" varchar
);

CREATE TABLE "rel_user_comment" (
  "id_user_comment" SERIAL PRIMARY KEY,
  "id_user" int NOT NULL,
  "id_comment" int NOT NULL
);

ALTER TABLE "posts" ADD FOREIGN KEY ("id_tags") REFERENCES "tags" ("id_tags");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_user_comment") REFERENCES "rel_user_comment" ("id_user_comment");

ALTER TABLE "rel_user_comment" ADD FOREIGN KEY ("id_user") REFERENCES "user" ("id_user");

ALTER TABLE "rel_user_comment" ADD FOREIGN KEY ("id_comment") REFERENCES "comments" ("id_comment");

insert into "user" (name, email, password, age) values 
('Diana', 'diana@gmail.com', 1237, 19),
('Daniel', 'daniel@gmail.com', 3213, 18),
('Luiz', 'tluiz34@gmail.com', 4532, 24),
('Sara', 'saraEspinoza1@gmail.com', 8464, 23);

insert into "tags" (name) values ('Filosofía'),('Mascotas');

insert into "comments" (comment) values ('¡Que bonito!'), ('¡Que buen pots!'), ('Me encanto'), ('Es super genial');

insert into "rel_user_comment" (id_user, id_comment) values (2,1), (1,2), (3,3), (2,4);

insert into "posts" (title, description, author, text, id_tags, id_user_comment) values 
('Datos curiosos', 'Frases mas conocidas del mundo medieval','Sócrates', 'lorem', 1, 2), 
('Peluditos', '7 tips para que tu mascota se comporte mejor','Estrellita777', 'lorem',2,3),
('Su dulsura', 'Las mejores medicinas para tu mascota','Farma25', 'lorem',2,1),
('Pensando soluciones', 'Las mejores soluciones para el día a día','Emperatriz Song', 'lorem',1,4);