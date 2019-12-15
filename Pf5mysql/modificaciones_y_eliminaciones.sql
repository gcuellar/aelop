-- Modifica la estructura de alguna de las tablas con el objeto de poder almacenar también las letras de las canciones.
ALTER TABLE cancion ADD COLUMN letra LONGTEXT;

-- Incluye la letra de la canción “Walking by myself” en la base de datos. La encontrarás en el anexo.
UPDATE cancion
SET letra = 'You know I love you.
You know it''s true.
Give you all my love, babe.
What more can I do?
Walking by myself,
I hope you''ll understand.
I just want to be your lovin'' man.
I love ya, yes I love you
with my heart and soul.
I wouldn''t mistreat you
for my weight in gold.
You know I love you.
You know it''s true.
Give you all my love, babe.
What more can I do?
Walking by myself,
I hope you''ll understand.
I just want to be your lovin'' man.
Here we go!
Keep on walkin''!
You know I love you.
You know it''s true.
I give you all my, babe.
What more can I do?
I''m walking by myself,
I hope you''ll understand.
I just want to be your lovin'' man.
I said I''m walking by myself,
I hope you''ll understand.
I just want to be your lovin'',
I just want to be your lovin'',
I just want to be your lovin'' man.
That''s right.'
WHERE nombre = 'Walking by myself';

-- Elimina la canción bonustrack del elepé “Still got the blues”.
DELETE
FROM `cancion`
WHERE cancion.`nombre` = 'bonustrack'
AND cancion.`id_disco` IN (SELECT `id_disco`
                           FROM `disco`
                           WHERE disco.`nombre` = 'Still got the blues');

-- Realiza una copia de seguridad de la base de datos.
-- En el fichero copiaseguridadbdd.sql

-- Elimina la base de datos.
DROP DATABASE musica;

-- Recupera la copia de seguridad de la base de datos.
-- Importando el ficero copiaseguridadbdd.sql
