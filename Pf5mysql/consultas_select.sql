-- Realiza las consultas de selección para recuperar la siguiente información.
--  Recupera la información de todos los artistas registrados en la base de datos por orden alfabético. Entendiendo por artistas los autores de discos
    SELECT `id_autor`as 'ID', `nombre` as 'Artista' FROM `autor` ORDER BY `nombre` ASC;

    SELECT `id_autor`as 'ID', a.`nombre` as 'Artista', COUNT(d.`nombre`) as 'Nº de discos', d.`nombre` as 'Uno de sus discos'
    FROM `autor` a INNER JOIN `disco` d USING (id_autor)
    GROUP BY a.`nombre`
    ORDER BY a.`nombre` ASC;

--  Recupera por orden alfabético la información de todos los discos registrados.
    SELECT `id_disco`as 'ID', d.`nombre`as 'Disco', `anyo`as 'Año', autor.`nombre`as 'Autor'
    FROM `disco` d INNER JOIN `autor` USING (`id_autor`)
    ORDER BY d.`nombre` ASC;

    -- Con los productores
    SELECT `id_disco` as 'ID', d.`nombre`as 'Disco', `anyo`as 'Año', autor.`nombre`as 'Autor', p.`nombre` as 'Productor'
    FROM `persona` p, `disco` d INNER JOIN `autor` USING (`id_autor`)
    INNER JOIN `produccion` prod USING (`id_disco`)
    WHERE p.`id_persona` = prod.`id_persona`
    ORDER BY d.`nombre` ASC;

--  Recupera por orden cronológico todos los discos publicados por el músico Gary Moore que están registrados en la base de datos.
    SELECT `id_disco`as 'ID', d.`nombre`as 'Disco', `anyo`as 'Año'
    FROM `disco` d INNER JOIN `autor` USING (`id_autor`)
    WHERE autor.`nombre` = 'Gary Moore'
    ORDER BY `anyo` ASC;

--  Recupera todas las canciones del elepé “Tentación” tal y cómo aparecen ordenadas en el disco.
    SELECT `numero` as 'Nº', c.`nombre`as 'Canción'
    FROM `cancion` c INNER JOIN `disco` d USING (`id_disco`)
    WHERE d.`nombre` = 'Tentación'
    ORDER BY `id_cancion` ASC;

--  Recupera toda la información relevante de la canción “Walking by myself”.
    SELECT c.`nombre` as 'Canción', d.`nombre` as 'Disco', c.`numero` as 'Posicion en el disco', a.`nombre` as 'Autor'
    FROM `disco` d
    INNER JOIN `cancion` c USING (`id_disco`)
    INNER JOIN `autor` a USING (`id_autor`)
    WHERE c.`nombre` = 'Walking by myself';

    -- Información sobre otros participantes
    SELECT p.`nombre`as 'Nombre', `rol` as 'Aportación a la canción'
    FROM `colaboracion` col
    INNER JOIN `disco` d USING (`id_disco`)
    INNER JOIN `persona` p USING (`id_persona`)
    INNER JOIN `cancion` can USING (`id_cancion`)
    WHERE can.`nombre` = 'Walking by myself'
    ORDER BY p.`nombre`;
