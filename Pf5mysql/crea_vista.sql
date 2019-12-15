-- Crea una vista que te permita recuperar toda la información relevante de la canción “Walking by myself”
CREATE VIEW `vista_cancion`(`Nombre`, `Disco`, `Orden en el disco`, `Autor`, `Letra`) AS
SELECT c.`nombre`, d.`nombre`, c.`numero`, a.`nombre`, `letra`
FROM `disco` d
INNER JOIN `cancion` c USING (`id_disco`)
INNER JOIN `autor` a USING (`id_autor`)
WHERE c.`nombre` = 'Walking by myself';
