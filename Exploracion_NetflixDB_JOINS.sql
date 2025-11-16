-- Pregunta 1
-- ¿Quien es el actor o actriz que ha participado en la mayor cantidad de series?

-- R: Gina Caranon, actor.id = 18, cantidad_actuaciones = 2

-- SQL: 
        SELECT ac.actor_id, a.nombre, COUNT(ac.actor_id) AS cantidad_actuaciones
        FROM actores AS a
        INNER JOIN actuaciones AS ac
        ON a.actor_id = ac.actor_id
        GROUP BY ac.actor_id
        ORDER BY cantidad_actuaciones DESC



-- Pregunta 2
-- ¿Cual es la serie con mejor rating promedio segun imdb?

-- R: serie_id = 8, titulo: Arcane, rating_promedio = 9.227

-- SQL: 
        SELECT e.serie_id, s.titulo, AVG(e.rating_imdb) AS rating_promedio
        FROM series AS s
        INNER JOIN episodios AS e
        ON s.serie_id = e.serie_id
        GROUP BY e.serie_id
        ORDER BY rating_promedio DESC



-- Pregunta 3
-- ¿Cual es el episodio con la duración más larga?

-- R: episodio_id = 119, titulo: The Sign of Three, duracion = 93 min, serie_id = 10, serie: Sherlock

-- SQL: 
        SELECT * 
        FROM episodios
        ORDER BY duracion DESC

        SELECT *
        FROM series
        WHERE serie_id = 10
