DROP TABLE IF EXISTS composers, films;

CREATE TABLE composers (
    id SERIAL PRIMARY KEY,
    name TEXT DEFAULT NULL
);

CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    composerId INTEGER REFERENCES composers(id) NOT NULL,
    title varchar(255) DEFAULT NULL
);

INSERT INTO composers (name) VALUES ('Hans Zimmer');
INSERT INTO composers (name) VALUES ('Philip Glass');
INSERT INTO composers (name) VALUES ('Johan Johannson');
INSERT INTO composers (name) VALUES ('Jonny Greenwood');
INSERT INTO composers (name) VALUES ('Alexandre Desplat');
INSERT INTO composers (name) VALUES ('John Williams');

INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Hans Zimmer'), 'The Lion King');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Hans Zimmer'), 'Inception');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Hans Zimmer'), 'Interstellar');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Philip Glass'), 'Koyaanisqatsi');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Philip Glass'), 'The Hours');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Philip Glass'), 'The Truman Show');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Johan Johannson'), 'Arrival');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Johan Johannson'), 'Sicario');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Johan Johannson'), 'Mandy');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Jonny Greenwood'), 'Phantom Thread');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Jonny Greenwood'), 'There Will Be Blood');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Jonny Greenwood'), 'Junun');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Alexandre Desplat'), 'The Shape of Water');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Alexandre Desplat'), 'The Grand Budapest Hotel');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='Alexandre Desplat'), 'Isle of Dogs');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='John Williams'), 'Schindler''s List');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='John Williams'), 'Star Wars');
INSERT INTO films (composerId, title) VALUES ((SELECT id from composers where name='John Williams'), 'Jaws');
