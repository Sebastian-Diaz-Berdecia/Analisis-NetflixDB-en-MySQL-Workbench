# Exploración NetflixDB 

El proposito de este proyecto es explicar de forma breve el proceso que se debe realizar para la creación e inicialización de la base de datos NetflixDB en MySQL Workbench, asi como también responder algunas preguntas sobre su contenido.

---
## Índice 
* #### [Diagrama entidad relación.](https://github.com/Sebastian-Diaz-Berdecia/Analisis-NetflixDB-en-MySQL-Workbench/tree/main#-diagrama-entidad-relaci%C3%B3n-der)
* #### [Creación de las tablas e inicialización de la base de datos.](https://github.com/Sebastian-Diaz-Berdecia/Analisis-NetflixDB-en-MySQL-Workbench/tree/main#-creaci%C3%B3n-de-las-tablas-e-inicializaci%C3%B3n-de-la-base-de-datos)
* #### [Inserción de datos en las tablas de la base de datos.]
* #### [Preguntas.]

## 🔑 Diagrama entidad relación (DER)

NetflixDB es una base de datos que consta de cuatro tablas: _series_, _actuaciones_, _actores_ y _episodios_ en donde se alamacena informacion sobre los episodios y actores de algunas series disponibles en el servicio de streaming de Neflix. A continuacion se muestra su diagrama entidad relación.

<img width="858" height="572" alt="image" src="https://github.com/user-attachments/assets/58e28b97-6de9-45a4-a568-39ae13a0999c" />

## 🛠 Creación de las tablas e inicialización de la base de datos

*  "CREATE DATABASE IF NOT EXISTS" &rarr; crea e inicializa la base de datos.
*  "CREATE TABLE IF NOT EXISTS" &rarr; crea cada una de las tablas y sus columnas.

```sql
CREATE DATABASE IF NOT EXISTS NetflixDB;
USE NetflixDB;

-- Creación de la tabla Series
CREATE TABLE IF NOT EXISTS Series (
    serie_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    año_lanzamiento INT,
    genero VARCHAR(255)
);

-- Creación de la tabla Episodios
CREATE TABLE IF NOT EXISTS Episodios (
    episodio_id INT AUTO_INCREMENT PRIMARY KEY,
    serie_id INT,
    titulo VARCHAR(255) NOT NULL,
    duracion INT,
    rating_imdb DECIMAL(3,1),
    temporada INT,
    descripcion TEXT,
    fecha_estreno DATE,
    FOREIGN KEY (serie_id) REFERENCES Series(serie_id)
);

-- Creación de la tabla Actores
CREATE TABLE IF NOT EXISTS Actores (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE
);

-- Creación de la tabla Actuaciones (relación muchos a muchos entre Actores y Series)
CREATE TABLE IF NOT EXISTS Actuaciones (
    actor_id INT,
    serie_id INT,
    personaje VARCHAR(255),
    FOREIGN KEY (actor_id) REFERENCES Actores(actor_id),
    FOREIGN KEY (serie_id) REFERENCES Series(serie_id),
    PRIMARY KEY (actor_id, serie_id)
);
```
## 📄 Inserción de datos en las tablas de la base de datos

* "USE" &rarr; nos permite designar en que base de datos se hara la inserción de datos.
* "INSERT" INTO &rarr; realiza la inserción de los datos en las tablas designadas.

```sql
USE NetflixDB;

-- Inserción de datos en la tabla Series
INSERT INTO Series (titulo, descripcion, año_lanzamiento, genero) VALUES 
('Breaking Bad', 'Un profesor de química se convierte en un rey del narcotráfico.', 2008, 'Drama'),
('Stranger Things', 'Niños en los 80s enfrentan fuerzas sobrenaturales y secretos gubernamentales.', 2016, 'Ciencia ficción'),
('The Crown', 'Drama histórico sobre el reinado de la Reina Isabel II del Reino Unido.', 2016, 'Drama histórico'),
('Black Mirror', 'Serie de antología que explora un futuro inquietante y distópico.', 2011, 'Ciencia ficción'),
('The Witcher', 'Un cazador de monstruos lucha por encontrar su lugar en un mundo donde las personas a menudo son más perversas.', 2019, 'Fantasía'),
('The Mandalorian', 'Un pistolero solitario explora los confines de la galaxia, lejos de la autoridad de la Nueva República.', 2019, 'Ciencia ficción'),
('BoJack Horseman', 'Un caballo antropomórfico lucha con la depresión y la adicción en esta comedia de animación para adultos.', 2014, 'Comedia'),
('Arcane', 'Basada en el universo de League of Legends, esta serie explora los orígenes de algunos campeones icónicos.', 2021, 'Animación'),
('Peaky Blinders', 'Una banda de gánsteres de Birmingham de la década de 1920 se eleva a la prominencia.', 2013, 'Drama histórico'),
('Sherlock', 'El detective más famoso del mundo resuelve misterios en el Londres del siglo XXI.', 2010, 'Drama'),
('Narcos', 'La historia del narcotráfico en Colombia', 2015, 'Biografía'),
('Game of Thrones', 'Nobles familias luchan por el control del Trono de Hierro', 2011, 'Fantasía'),
('The Office', 'La vida cotidiana de los empleados de Dunder Mifflin', 2005, 'Comedia');

-- Inserción de datos en la tabla Actores
INSERT INTO Actores (nombre, fecha_nacimiento) VALUES
('Bryan Cranston', '1956-03-07'),
('Millie Bobby Brown', '2004-02-19'),
('Claire Foy', '1984-04-16'),
('Mads Mikkelsen', '1965-11-22'),
('Henry Cavill', '1983-05-05'),
('Pedro Pascal', '1975-04-02'),
('Will Arnett', '1970-05-04'),
('Hailee Steinfeld', '1996-12-11'),
('Cillian Murphy', '1976-05-25'),
('Benedict Cumberbatch', '1976-07-19'),
('Wagner Moura', '1976-06-27'),
('Emilia Clarke', '1986-10-23'),
('Steve Carell', '1962-08-16'),
('Aaron Paul', '1979-08-27'),
('Winona Ryder', '1971-10-29'),
('Olivia Colman', '1974-01-30'),
('Anya Chalotra', '1996-07-21'),
('Gina Carano', '1982-04-16'),
('Amy Sedaris', '1961-03-29'),
('Sophie Turner', '1996-02-21'),
('Matt Smith', '1982-10-28'),
('Ella Purnell', '1996-09-17'),
('Paul Anderson', '1978-02-12'),
('Martin Freeman', '1971-09-08'),
('Boyd Holbrook', '1981-09-01'),
('Lena Headey', '1973-10-03'),
('Kit Harington', '1986-12-26'),
('Gwendoline Christie', '1978-10-28'),
('Rami Malek', '1981-05-12'),
('Carla Gugino', '1971-08-29'),
('Jonathan Groff', '1985-03-26'),
('Charlie Cox', '1982-12-15'),
('Nicola Coughlan', '1987-01-09'),
('Asa Butterfield', '1997-04-01'),
('Mackenzie Davis', '1987-04-01');


-- Inserción de datos en la tabla Episodios
INSERT INTO Episodios (serie_id, titulo, duracion, rating_imdb, temporada, descripcion, fecha_estreno) VALUES
(1, 'Piloto', 58, 9, 1, 'Un profesor de química recibe un diagnóstico terminal y decide convertirse en fabricante de metanfetaminas.', '2008-01-20'),
(1, 'Gato en un saco', 47, 8.7, 2, 'Walt y Jesse tratan de deshacerse de dos cuerpos mientras que al mismo tiempo tienen que lidiar con un testigo problemático.', '2009-05-10'),
(1, 'Mandala', 48, 8.6, 2, 'Walt y Jesse deciden buscar un nuevo socio para poder expandir su negocio.', '2009-05-17'),
(1, 'Phoenix', 47, 9.1, 2, 'Walt experimenta uno de sus mayores conflictos éticos cuando Jesse hace una nueva amiga.', '2009-05-24'),
(1, 'ABQ', 47, 9.2, 2, 'Desastres colaterales llevan a Walt a manipular eventos que afectan a los que lo rodean.', '2009-05-31'),
(1, 'No más', 47, 9, 3, 'Walt lidia con las consecuencias de sus acciones. Jesse está cada vez más distante.', '2010-03-21'),
(1, 'Caballo sin nombre', 47, 8.7, 3, 'Walt encuentra problemas cuando regresa a su casa. Jesse lucha por su sobrevivencia.', '2010-03-28'),
(1, 'I.F.T.', 47, 8.4, 3, 'Skyler toma una decisión que sorprende a Walt y Jesse. Las tensiones escalan.', '2010-04-04'),
(1, 'Verde luz', 45, 8.5, 3, 'Walt pierde el control, poniendo en peligro todo lo que ha construido.', '2010-04-11'),
(1, 'Más', 47, 8.8, 3, 'Jesse toma una decisión importante sobre su futuro mientras que Walt se consolida.', '2010-04-18'),
(1, 'Atardecer', 45, 9.5, 3, 'Walt y Jesse se encuentran en una situación extrema y deben encontrar una salida rápida.', '2010-04-25'),
(2, 'El desaparecido', 50, 9, 1, 'Cuando un niño desaparece, sus amigos encuentran una chica con poderes misteriosos.', '2016-07-15'),
(2, 'La desaparición de Will Byers', 47, 9, 1, 'Después de que Will Byers desaparece misteriosamente, sus amigos comienzan una búsqueda que les lleva a encontrar a una chica con poderes extraños.', '2016-07-15'),
(2, 'La loca de la calle Maple', 55, 8.9, 1, 'Lucas, Mike y Dustin intentan hablar con la chica que encontraron en el bosque. Mientras tanto, Hopper investiga la desaparición de Will.', '2016-07-15'),
(2, 'Todo está patas arriba', 51, 9, 1, 'Joyce está convencida de que Will se está comunicando con ella. Los chicos le dan un nombre a la chica: Once.', '2016-07-15'),
(2, 'El cadáver', 50, 9.1, 1, 'Los chicos encuentran una forma de entrar en el Mundo del Revés para buscar a Will. Nancy y Jonathan confrontan la fuerza que se llevó a Barb.', '2016-07-15'),
(2, 'La pulga y el acróbata', 53, 9.1, 1, 'Hopper entra en el laboratorio para encontrar la verdad sobre el Mundo del Revés. Los chicos ponen a prueba la teoría del acróbata y la pulga.', '2016-07-15'),
(2, 'MADMAX', 64, 9, 2, 'Stranger Things Season 2 Episode 1', '2017-11-03'),
(2, 'Trick or Treat, Freak', 44, 10, 2, 'Stranger Things Season 2 Episode 2', '2017-11-10'),
(2, 'The Pollywog', 64, 8, 2, 'Stranger Things Season 2 Episode 3', '2017-11-17'),
(2, 'Will the Wise', 61, 8, 2, 'Stranger Things Season 2 Episode 4', '2017-11-24'),
(2, 'Dig Dug', 56, 9, 2, 'Stranger Things Season 2 Episode 5', '2017-12-01'),
(2, 'The Spy', 44, 10, 2, 'Stranger Things Season 2 Episode 6', '2017-12-08'),
(2, 'The Lost Sister', 52, 9, 2, 'Stranger Things Season 2 Episode 7', '2017-12-15'),
(2, 'The Mind Flayer', 62, 10, 2, 'Stranger Things Season 2 Episode 8', '2017-12-22'),
(2, 'The Gate', 46, 8, 2, 'Stranger Things Season 2 Episode 9', '2017-12-29'),
(2, 'Suzie, Do You Copy?', 49, 10, 3, 'Stranger Things Season 3 Episode 1', '2019-07-11'),
(2, 'The Mall Rats', 50, 9, 3, 'Stranger Things Season 3 Episode 2', '2019-07-18'),
(2, 'The Case of the Missing Lifeguard', 55, 9, 3, 'Stranger Things Season 3 Episode 3', '2019-07-25'),
(2, 'The Sauna Test', 59, 9, 3, 'Stranger Things Season 3 Episode 4', '2019-08-01'),
(2, 'The Source', 61, 8, 3, 'Stranger Things Season 3 Episode 5', '2019-08-08'),
(2, 'The Birthday', 56, 9, 3, 'Stranger Things Season 3 Episode 6', '2019-08-15'),
(2, 'The Bite', 46, 9, 3, 'Stranger Things Season 3 Episode 7', '2019-08-22'),
(2, 'The Battle of Starcourt', 52, 8, 3, 'Stranger Things Season 3 Episode 8', '2019-08-29'),
(3, 'La corona pesada', 52, 9, 1, 'Isabel II es coronada reina en una época de cambio político y conflictos personales.', '2016-11-04'),
(3, 'Winds of Change', 58, 8.9, 1, 'El Primer Ministro Macmillan enfrenta crisis políticas y personales que afectan su liderazgo.', '2016-11-20'),
(3, 'Hyde Park Corner', 56, 9.0, 1, 'Isabel enfrenta sus nuevas responsabilidades como reina mientras lidia con noticias trágicas desde el extranjero.', '2016-11-27'),
(3, 'Gelignite', 57, 8.7, 1, 'Los planes matrimoniales de la princesa Margarita enfrentan obstáculos institucionales y públicos.', '2016-12-04'),
(3, 'Act of God', 54, 8.8, 1, 'Una gran neblina cubre Londres, causando problemas de salud y políticos para Winston Churchill.', '2016-12-11'),
(3, 'Smoke and Mirrors', 56, 9.1, 1, 'La coronación de Isabel II toma lugar bajo la sombra de las luchas familiares y políticas.', '2016-12-18'),
(3, 'Scientia Potentia Est', 55, 9.2, 1, 'La joven reina debe navegar las complejidades de una crisis de Suez emergente.', '2017-01-08'),
(3, 'Pride & Joy', 54, 8.5, 1, 'La Reina Madre explora su nuevo papel, mientras Isabel ajusta su enfoque como monarca y madre.', '2017-01-15'),
(3, 'Education', 53, 8.6, 2, 'Isabel se enfrenta al sistema educativo cuando examina las opciones para sus hijos.', '2017-01-22'),
(3, 'Mystery Man', 56, 8.9, 2, 'Un escándalo en el palacio lleva a una serie de revelaciones impactantes.', '2017-01-29'),
(3, 'Marionettes', 55, 9.0, 2, 'Una figura pública cuestiona la relevancia y el costo de la monarquía, provocando un debate nacional.', '2017-02-05'),
(4, 'Caída en picada', 60, 8, 3, 'En un mundo donde la estatus social se mide por calificaciones, una mujer intenta mejorar su puntuación.', '2016-10-21'),
(4, 'USS Callister', 76, 8.3, 4, 'Un programador talentoso crea una versión digital de sí mismo para ejercer control en un universo virtual.', '2017-12-29'),
(4, 'Arkangel', 52, 7.3, 4, 'Una madre instala un sistema de vigilancia que le permite ver todo lo que ve su hija y controlar sus experiencias.', '2017-12-29'),
(4, 'Crocodile', 59, 7.7, 4, 'Un accidente desencadena una serie de eventos que obligan a una mujer a ir a extremos para ocultar sus actos.', '2017-12-29'),
(4, 'Hang the DJ', 51, 8.8, 4, 'Dos personas se enfrentan a un sistema de citas que predefine la duración de todas sus relaciones.', '2017-12-29'),
(4, 'Metalhead', 41, 6.7, 4, 'En un almacén post-apocalíptico, una mujer intenta escapar de un perro robot que está programado para matar.', '2017-12-29'),
(4, 'Black Museum', 69, 8.7, 4, 'Una mujer visita un museo que muestra artefactos tecnológicos con historias oscuras asociadas a ellos.', '2017-12-29'),
(4, 'Striking Vipers', 62, 7.5, 5, 'Dos viejos amigos se reencuentran y exploran nuevas identidades en un juego de realidad virtual.', '2019-06-05'),
(4, 'Smithereens', 70, 7.2, 5, 'Un hombre secuestra a un empleado de una empresa tecnológica para exponer su impacto destructivo en la sociedad.', '2019-06-05'),
(4, 'Rachel, Jack and Ashley Too', 67, 6.1, 5, 'Una adolescente solitaria encuentra consuelo en una muñeca de inteligencia artificial que imita a su cantante favorita.', '2019-06-05'),
(4, 'The National Anthem', 44, 7.3, 1, 'El primer ministro del Reino Unido enfrenta una crisis peculiar y humillante involucrando un secuestro.', '2011-12-04'),
(5, 'El fin del principio', 60, 9, 1, 'Geralt de Rivia, un cazador de monstruos solitario, lucha por encontrar su lugar en un mundo turbulento.', '2019-12-20'),
(5, 'A Grain of Truth', 63, 8.4, 2, 'Geralt encuentra a un viejo amigo en una mansión maldita y descubre los oscuros secretos que guarda.', '2021-12-17'),
(5, 'Kaer Morhen', 47, 9.1, 2, 'Geralt lleva a Ciri a su hogar ancestral para protegerla y entrenarla, mientras fuerzas oscuras continúan su búsqueda.', '2021-12-17'),
(5, 'What is Lost', 55, 8.3, 2, 'Recuerdos del pasado de Geralt surgen mientras enfrenta un nuevo enemigo que pone a prueba sus convicciones.', '2021-12-17'),
(5, 'Redanian Intelligence', 59, 8.5, 2, 'Mientras Geralt defiende a Ciri, espías y conspiraciones políticas tejen una red de engaños alrededor de ellos.', '2021-12-17'),
(5, 'Turn Your Back', 61, 8.8, 2, 'Ciri lucha con su identidad y poderes crecientes; Geralt debe tomar decisiones difíciles para su protección.', '2021-12-17'),
(5, 'Dear Friend', 50, 8.2, 2, 'Geralt y Ciri buscan la ayuda de una poderosa aliada, enfrentando viejos amigos y nuevos rivales en su camino.', '2021-12-17'),
(5, 'Voleth Meir', 58, 9.0, 2, 'Una entidad misteriosa ofrece respuestas y poder, pero a un costo que podría ser demasiado alto para pagar.', '2021-12-17'),
(5, 'Family', 65, 9.3, 2, 'La definición de familia se pone a prueba cuando aliados inesperados se unen para enfrentar una amenaza común.', '2021-12-17'),
(5, 'Withering Flame', 53, 8.9, 2, 'En busca de una cura para una maldición, Geralt se enfrenta a una verdad incómoda sobre los monstruos y los hombres.', '2021-12-17'),
(5, 'The Pensive Dragon', 60, 9.2, 2, 'Geralt y Ciri enfrentan su destino mientras descubren el lazo que los une más allá de la magia y las espadas.', '2021-12-17'),
(6, 'The Siege', 42, 8.9, 2, 'El Mandaloriano regresa a Nevarro para reparaciones y se ve envuelto en una misión para destruir una base imperial.', '2020-11-20'),
(6, 'The Jedi', 47, 9.5, 2, 'El Mandaloriano y Grogu viajan a un antiguo templo Jedi, donde encuentran a una figura legendaria del pasado.', '2020-11-27'),
(6, 'The Tragedy', 33, 9.3, 2, 'Tragedia golpea cuando las fuerzas imperiales localizan a Grogu mientras el Mandaloriano busca aliados.', '2020-12-04'),
(6, 'The Believer', 38, 8.7, 2, 'Para rescatar a Grogu, el Mandaloriano debe infiltrarse en una instalación imperial con la ayuda de un viejo enemigo.', '2020-12-11'),
(6, 'The Rescue', 45, 9.8, 2, 'El Mandaloriano y sus aliados lanzan un audaz rescate para salvar a Grogu de las garras del Imperio.', '2020-12-18'),
(6, 'The Marshal', 52, 8.8, 2, 'En su misión para devolver a Grogu a los Jedi, el Mandaloriano se encuentra con un alguacil usando una armadura Mandaloriana.', '2020-10-30'),
(6, 'The Passenger', 41, 7.9, 2, 'El Mandaloriano acepta transportar a un pasajero con un precioso cargamento a cambio de información crucial.', '2020-11-06'),
(6, 'The Heiress', 35, 8.6, 2, 'El Mandaloriano se encuentra con guerreros Mandalorianos que lo desafían a cuestionar sus creencias y su camino.', '2020-11-13'),
(6, 'The Search', 44, 8.5, 3, 'El Mandaloriano busca la verdad sobre el origen de Grogu y su conexión con los Mandalorianos.', '2021-12-15'),
(6, 'The Reckoning', 48, 9.1, 3, 'Una amenaza del pasado resurge, forzando al Mandaloriano a enfrentar su pasado y tomar decisiones cruciales para su futuro.', '2021-12-22'),
(6, 'El mandaloriano', 40, 9, 1, 'Un cazarrecompensas mandaloriano protege a un niño de gran poder.', '2019-11-12'),
(7, 'BoJack el destructor', 25, 8, 1, 'BoJack Horseman, una estrella de TV en decadencia, intenta retomar su carrera y vida.', '2014-08-22'),
(7, 'The Telescope', 25, 8.6, 1, 'BoJack se reencuentra con un amigo del pasado que le trae noticias perturbadoras.', '2014-08-22'),
(7, 'Downer Ending', 25, 9.3, 1, 'BoJack tiene visiones surrealistas sobre su vida mientras intenta escribir su propia autobiografía.', '2014-08-22'),
(7, 'Later', 25, 8.9, 1, 'El libro de BoJack es un éxito, pero la felicidad le sigue siendo esquiva.', '2014-08-22'),
(7, 'Brand New Couch', 26, 8.5, 2, 'BoJack trata de cambiar su vida con la esperanza de ser una mejor persona y encontrar la redención.', '2015-07-17'),
(7, 'Yesterdayland', 26, 8.2, 2, 'BoJack encuentra romance en una feria de ciencia ficción, mientras Todd construye un parque temático.', '2015-07-17'),
(7, 'Higher Love', 26, 8.4, 2, 'BoJack persigue un nuevo romance que lo lleva por un camino de auto-descubrimiento y complicaciones inesperadas.', '2015-07-17'),
(7, 'Hank After Dark', 25, 8.8, 2, 'Diane enfrenta consecuencias inesperadas cuando intenta exponer los secretos de una celebridad.', '2015-07-17'),
(7, 'Let’s Find Out', 26, 9.6, 2, 'BoJack aparece en un juego de preguntas televisivo y enfrenta preguntas difíciles sobre su pasado.', '2015-07-17'),
(7, 'The Shot', 26, 9.0, 2, 'BoJack tiene la oportunidad de realizar una escena cinematográfica soñada, pero las cosas no salen como esperaba.', '2015-07-17'),
(7, 'Escape from L.A.', 26, 9.7, 2, 'BoJack huye a Nuevo México para escapar de sus problemas en Los Ángeles, solo para encontrar nuevos dilemas.', '2015-07-17'),
(8, 'Bienvenidos a Zaun', 45, 9, 1, 'Dos hermanas se encuentran en lados opuestos de una guerra entre ciudades futuristas.', '2021-11-06'),
(8, 'Some Mysteries Are Better Left Unsolved', 44, 9.2, 1, 'Vi y Powder descubren un secreto que podría cambiar todo lo que saben sobre su familia.', '2021-11-13'),
(8, 'When These Walls Come Tumbling Down', 42, 9.0, 1, 'Las tensiones entre Piltover y Zaun alcanzan un punto crítico tras un devastador ataque.', '2021-11-13'),
(8, 'The Base Violence Necessary for Change', 45, 9.5, 1, 'Un nuevo líder emerge en Zaun, prometiendo revolución y desafiando el equilibrio de poder.', '2021-11-20'),
(8, 'Happy Progress Day!', 48, 9.3, 1, 'Piltover celebra el Día del Progreso, pero los eventos toman un giro oscuro cuando los secretos son revelados.', '2021-11-20'),
(8, 'Everybody Wants to Be My Enemy', 43, 9.4, 1, 'Mientras Vi lucha por proteger a su hermana, antiguos aliados se convierten en nuevos enemigos.', '2021-11-20'),
(8, 'The Boy Savior', 42, 9.1, 1, 'Ekko intenta salvar a Zaun de sus propios demonios internos y del avance de enemigos externos.', '2021-11-27'),
(8, 'Oil and Water', 45, 8.9, 1, 'Los hermanos se encuentran en lados opuestos de la guerra, cada uno luchando por sus ideales y seres queridos.', '2021-11-27'),
(8, 'The Monster You Created', 47, 9.6, 1, 'Confrontaciones del pasado regresan para desafiar las alianzas actuales y el futuro de Zaun y Piltover.', '2021-11-27'),
(8, 'Bridges Burn', 44, 9.0, 1, 'La batalla por el puente entre Piltover y Zaun deja cicatrices profundas y decisiones difíciles para Vi y Powder.', '2021-12-04'),
(8, 'The Will of the Blades', 46, 9.5, 1, 'En el clímax de la temporada, los personajes enfrentan sus destinos y hacen elecciones que cambiarán sus mundos para siempre.', '2021-12-04'),
(9, 'Birmingham en llamas', 60, 9, 1, 'Tommy Shelby lidera a los Peaky Blinders, una banda de gánsteres, hacia la dominación de Birmingham.', '2013-09-12'),
(9, 'Black Tuesday', 57, 8.8, 5, 'Los Shelby enfrentan las repercusiones del crac del 29 y nuevas oportunidades de expansión en América.', '2019-08-25'),
(9, 'Black Cats', 58, 9.1, 5, 'Tommy descubre una traición mientras nuevos enemigos emergen en las sombras.', '2019-09-01'),
(9, 'Strategy', 56, 9.0, 5, 'Tommy traza un nuevo plan político mientras maneja tensiones internas dentro de los Peaky Blinders.', '2019-09-08'),
(9, 'The Loop', 59, 8.9, 5, 'Los Shelby participan en una arriesgada carrera de caballos que promete grandes recompensas.', '2019-09-15'),
(9, 'The Shock', 60, 9.2, 5, 'Una revelación sorprendente pone a prueba la lealtad de Tommy y plantea nuevas alianzas.', '2019-09-22'),
(9, 'Mr. Jones', 59, 9.3, 5, 'Tommy se enfrenta cara a cara con un enemigo formidable, culminando en un tenso encuentro.', '2019-09-29'),
(9, 'Blackbird', 58, 8.7, 6, 'Arthur recibe una misión que podría cambiar el destino de los Shelby, mientras Tommy explora caminos espirituales.', '2021-02-28'),
(9, 'Gold', 57, 8.6, 6, 'La familia Shelby descubre una mina de oro potencial que los pone en el radar de una nueva amenaza.', '2021-03-07'),
(9, 'The Noose', 56, 9.4, 6, 'El cerco se cierra en torno a los Shelby mientras luchan por mantener el control de sus territorios.', '2021-03-14'),
(9, 'Lock and Key', 60, 9.5, 6, 'Tommy enfrenta la posible destrucción de todo lo que ha construido, mientras busca redimirse y asegurar su legado.', '2021-03-21'),
(10, 'Un estudio en rosa', 90, 9, 1, 'Sherlock Holmes se enfrenta a un caso que lo lleva a cruzar caminos con el doctor John Watson.', '2010-07-25'),
(10, 'The Blind Banker', 88, 8.1, 1, 'Sherlock y Watson investigan una serie de símbolos misteriosos que están relacionados con robos en un banco.', '2010-08-01'),
(10, 'The Great Game', 89, 9.1, 1, 'Sherlock se encuentra en una carrera contra el tiempo cuando un loco amenaza con matar inocentes como parte de un "juego" retorcido.', '2010-08-08'),
(10, 'A Scandal in Belgravia', 90, 9.5, 2, 'Sherlock se enfrenta a una dominatrix que sabe demasiados secretos de gente poderosa.', '2012-01-01'),
(10, 'The Hounds of Baskerville', 88, 8.5, 2, 'Sherlock y Watson exploran una leyenda aterradora cuando visitan el páramo de Dartmoor.', '2012-01-08'),
(10, 'The Reichenbach Fall', 90, 9.6, 2, 'Sherlock se enfrenta a su mayor desafío cuando Moriarty trama un plan para desacreditarlo y destruirlo.', '2012-01-15'),
(10, 'The Empty Hearse', 90, 9.0, 3, 'Sherlock regresa después de su "muerte" para detener un ataque terrorista en Londres.', '2014-01-01'),
(10, 'The Sign of Three', 93, 9.0, 3, 'Sherlock enfrenta un desafío diferente mientras trata de dar el mejor discurso en la boda de Watson.', '2014-01-05'),
(10, 'His Last Vow', 89, 9.3, 3, 'Sherlock se encuentra en un juego mortal de mente contra Charles Augustus Magnussen, un maestro chantajista.', '2014-01-12'),
(10, 'The Six Thatchers', 90, 7.7, 4, 'Sherlock se ve envuelto en un misterio cuando se destrozan bustos de Margaret Thatcher.', '2017-01-01'),
(10, 'The Lying Detective', 90, 9.0, 4, 'Después de una tragedia personal, Watson se distancia de Sherlock, quien a su vez se involucra con un poderoso enemigo.', '2017-01-08'),
(11, 'La catedral del mar', 55, 8, 1, 'En la Barcelona del siglo XIV, un hombre se eleva de la esclavitud para convertirse en un comerciante respetado.', '2018-05-23'),
(11, 'Descenso', 57, 8.9, 1, 'El agente Steve Murphy llega a Colombia para ayudar en la lucha contra el narcotráfico y pronto se entera del poder de Pablo Escobar.', '2015-08-28'),
(11, 'The Sword of Simón Bolívar', 47, 8.7, 1, 'Mientras Pablo Escobar se expande en el negocio, las autoridades comienzan a ver la magnitud de su imperio.', '2015-08-28'),
(11, 'The Men of Always', 47, 8.5, 1, 'Escobar busca legitimidad política, pero sus ambiciones se encuentran con resistencia.', '2015-08-28'),
(11, 'The Palace in Flames', 45, 9.0, 1, 'Un ataque audaz contra el Palacio de Justicia es vinculado a Escobar, causando un conflicto masivo.', '2015-08-28'),
(11, 'There Will Be a Future', 51, 8.8, 1, 'Escobar maneja negociaciones con el gobierno para su rendición, pero los acuerdos no satisfacen a todos.', '2015-08-28'),
(11, 'Explosivos', 49, 8.6, 1, 'Pablo implementa tácticas cada vez más extremas para gestionar amenazas políticas y de la ley.', '2015-08-28'),
(11, 'You Will Cry Tears of Blood', 52, 9.1, 1, 'La guerra entre el cartel y el gobierno se intensifica, causando daños colaterales significativos.', '2015-08-28'),
(11, 'La Gran Mentira', 50, 8.9, 1, 'Los esfuerzos para capturar a Escobar se complican por sus tácticas para evadir a la ley.', '2015-08-28'),
(11, 'La Catedral', 54, 9.3, 1, 'Escobar se rinde bajo condiciones favorables, pero su tiempo en prisión es cualquier cosa menos convencional.', '2015-08-28'),
(11, 'Despegue', 56, 9.4, 1, 'La situación se agrava cuando Escobar escapa de la prisión, llevando la batalla a nuevos extremos.', '2015-08-28'),
(12, 'El invierno se acerca', 60, 9, 1, 'Los Stark se enfrentan a la traición mientras se cierne la amenaza de los Caminantes Blancos.', '2011-04-17'),
(12, 'La batalla de los bastardos', 60, 10, 6, 'Jon Snow enfrenta a Ramsay Bolton en una de las batallas más épicas por el Norte.', '2016-06-19'),
(12, 'The Kingsroad', 56, 8.8, 1, 'Mientras los Stark viajan al sur, Jon Snow se dirige al norte para unirse a la Guardia de la Noche.', '2011-04-24'),
(12, 'Lord Snow', 58, 8.7, 1, 'Jon se enfrenta a la dura realidad de la Guardia de la Noche. Ned Stark llega a King’s Landing y descubre la corrupción de la corte.', '2011-05-01'),
(12, 'Cripples, Bastards, and Broken Things', 56, 8.8, 1, 'Tyrion hace un nuevo amigo en el camino. Ned investiga la muerte de su predecesor.', '2011-05-08'),
(12, 'The Wolf and the Lion', 55, 9.1, 1, 'La tensión entre las casas Stark y Lannister escala hacia un conflicto abierto.', '2011-05-15'),
(12, 'A Golden Crown', 53, 9.2, 1, 'Viserys Targaryen hace una última demanda por su corona, lo que lleva a consecuencias mortales.', '2011-05-22'),
(12, 'You Win or You Die', 58, 9.3, 1, 'Ned Stark hace una jugada crítica en el juego de tronos, mientras Jon descubre una verdad oscura en el Muro.', '2011-05-29'),
(12, 'The Pointy End', 59, 9.1, 1, 'Los Stark enfrentan graves peligros tras la captura de Ned, y Arya y Sansa se ven en situaciones difíciles.', '2011-06-05'),
(12, 'Baelor', 57, 9.6, 1, 'Ned enfrenta su destino mientras Sansa ruega por su vida. Robb lucha por salvar a su padre.', '2011-06-12'),
(12, 'Fire and Blood', 53, 9.5, 1, 'Arya comienza su viaje para escapar de King’s Landing. Daenerys toma decisiones cruciales tras una gran pérdida.', '2011-06-19'),
(12, 'The North Remembers', 53, 8.9, 2, 'Tyrion llega a King’s Landing para tomar su lugar como Mano del Rey. Stannis Baratheon planea reclamar su derecho al trono.', '2012-04-01'),
(13, 'Diversidad', 22, 8, 1, 'Michael intenta enseñar diversidad a sus empleados de una manera muy Michael Scott.', '2005-03-29'),
(13, 'La alianza', 22, 8, 1, 'Michael intenta formar una alianza para sobrevivir a los recortes de personal, mientras Dwight inicia su propia alianza secreta.', '2005-04-12'),
(13, 'Health Care', 22, 8.0, 1, 'Michael delega la tarea de elegir un nuevo plan de salud, lo que lleva a Dwight a hacer recortes impopulares.', '2005-04-05'),
(13, 'The Alliance', 22, 8.1, 1, 'Michael intenta mejorar la moral de la oficina con un cumpleaños, mientras Dwight busca aliados para su supervivencia en la oficina.', '2005-04-12'),
(13, 'Basketball', 23, 8.4, 1, 'Michael organiza un partido de baloncesto entre los trabajadores de la oficina y el almacén, lo que lleva a una competencia feroz.', '2005-04-19'),
(13, 'Hot Girl', 23, 7.9, 1, 'Una vendedora atractiva visita la oficina, y los hombres intentan impresionarla, lo que causa tensiones y celos.', '2005-04-26'),
(13, 'The Dundies', 21, 8.7, 2, 'Michael presenta los premios Dundie en Chili’s, y la noche está llena de sorpresas y revelaciones inesperadas.', '2005-09-20'),
(13, 'Office Olympics', 22, 8.9, 2, 'Mientras Michael y Dwight no están, Jim organiza los Juegos Olímpicos de la Oficina para levantar el ánimo.', '2005-10-04'),
(13, 'The Fire', 22, 8.4, 2, 'Un pequeño incendio en la cocina lleva a los empleados a participar en juegos de confesiones y revelaciones personales.', '2005-10-11'),
(13, 'Halloween', 22, 8.2, 2, 'Es Halloween y Michael tiene que despedir a alguien, lo que crea una atmósfera tensa en la oficina.', '2005-10-18'),
(13, 'The Client', 22, 9.0, 2, 'Michael y Jan logran un importante trato con un cliente, mientras que en la oficina los empleados encuentran un guion escrito por Michael.', '2005-11-08'),
(13, 'Performance Review', 22, 8.4, 2, 'Es la época de evaluaciones de desempeño, y Michael se centra en sus propios asuntos personales en lugar de en las evaluaciones.', '2005-11-15');


-- Inserción de datos en la tabla Actuaciones
INSERT INTO Actuaciones (actor_id, serie_id, personaje) VALUES
(1, 1, 'Walter White'), -- Bryan Cranston en Breaking Bad
(14, 1, 'Jesse Pinkman'), -- Aaron Paul en Breaking Bad
(2, 2, 'Eleven'), -- Millie Bobby Brown en Stranger Things
(15, 2, 'Joyce Byers'), -- Winona Ryder en Stranger Things
(3, 3, 'Reina Isabel II'), -- Claire Foy en The Crown
(21, 3, 'Príncipe Felipe'), -- Matt Smith en The Crown
(5, 5, 'Geralt de Rivia'), -- Henry Cavill en The Witcher
(17, 5, 'Yennefer de Vengerberg'), -- Anya Chalotra en The Witcher
(6, 6, 'Din Djarin'), -- Pedro Pascal en The Mandalorian
(18, 6, 'Cara Dune'), -- Gina Carano en The Mandalorian
(7, 7, 'BoJack Horseman'), -- Will Arnett en BoJack Horseman
(19, 7, 'Princess Carolyn'), -- Amy Sedaris en BoJack Horseman
(8, 8, 'Vi'), -- Hailee Steinfeld en Arcane
(22, 8, 'Jinx'), -- Ella Purnell en Arcane
(9, 9, 'Tommy Shelby'), -- Cillian Murphy en Peaky Blinders
(23, 9, 'Arthur Shelby'), -- Paul Anderson en Peaky Blinders
(10, 10, 'Sherlock Holmes'), -- Benedict Cumberbatch en Sherlock
(24, 10, 'Dr. John Watson'), -- Martin Freeman en Sherlock
(11, 11, 'Pablo Escobar'), -- Wagner Moura en Narcos
(25, 11, 'Steve Murphy'), -- Boyd Holbrook en Narcos
(12, 12, 'Daenerys Targaryen'), -- Emilia Clarke en Game of Thrones
(26, 12, 'Cersei Lannister'), -- Lena Headey en Game of Thrones
(27, 12, 'Jon Snow'), -- Kit Harington en Game of Thrones
(28, 12, 'Brienne of Tarth'), -- Gwendoline Christie en Game of Thrones
(13, 13, 'Michael Scott'), -- Steve Carell en The Office
(29, 4, 'Elliot Alderson'), -- Rami Malek en una serie de temática similar como Mr. Robot
(30, 2, 'Olivia Crain'), -- Carla Gugino en una serie de temática similar como The Haunting of Hill House
(31, 6, 'Holden Ford'), -- Jonathan Groff en una serie de temática similar como Mindhunter
(32, 9, 'Matt Murdock/Daredevil'), -- Charlie Cox en una serie de temática similar como Daredevil
(33, 3, 'Penelope Featherington'), -- Nicola Coughlan en una serie de temática similar como Bridgerton
(34, 7, 'Otis Milburn'), -- Asa Butterfield en una serie de temática similar como Sex Education
(35, 4, 'Cameron Howe'), -- Mackenzie Davis en una serie de temática similar como Halt and Catch Fire
(16, 2, 'Daenerys Targaryen'), -- Emilia Clarke en Game of Thrones
(20, 13, 'Sansa Stark'), -- Sophie Turner en Game of Thrones
(18, 8, 'Kamille "Cami" OConnell'); -- Gina Carano en una serie de temática similar como The Originals (no exactamente, pero por falta de una mejor opción);
```


## Preguntas:
### 1. ¿Quien es el actor o actriz que ha participado en la mayor cantidad de series?

```sql

SELECT ac.actor_id, a.nombre, COUNT(ac.actor_id) AS cantidad_actuaciones
FROM actores AS a
INNER JOIN actuaciones AS ac
ON a.actor_id = ac.actor_id
GROUP BY ac.actor_id
ORDER BY cantidad_actuaciones DESC
LIMIT 5

```

| nombre                 | cantidad_actuaciones |
|:------------------------:|:-----------------------:|
| Gina Carano            | 2 |
| Bryan Cranston         | 1 |
| Millie Bobby Brown     | 1 |
| Claire Foy             | 1 |
| Henry Cavill           | 1 |

R// Gina Carrano con 2 actuaciones.

### 2. ¿Cual es la serie con mejor rating promedio segun imdb?

```sql

SELECT s.titulo, AVG(e.rating_imdb) AS Rating_promedio
FROM series AS s
LEFT JOIN  episodios AS e
ON s.serie_id = e.serie_id
GROUP BY s.titulo
ORDER BY Rating_promedio DESC
LIMIT 5

```

| titulo            | Rating_promedio |
|:-------------------:|------------------:|
| Arcane            | 9.22727 |
| Game of Thrones   | 9.16667 |
| Peaky Blinders    | 9.04545 |
| Stranger Things   | 8.96087 |
| The Mandalorian   | 8.91818 |

R// Arcane con un rating promedio de 9.227.

### 3. ¿Cual es el episodio con la mayor duración?

```sql

SELECT titulo, duracion 
FROM episodios
ORDER BY duracion DESC
LIMIT 5

```

| titulo                 | duracion |
|:----------------------:|:--------:|
| The Sign of Three      | 93 |
| A Scandal in Belgravia | 90 |
| The Empty Hearse       | 90 |
| The Reichenbach Fall   | 90 |
| Un estudio en rosa     | 90 |

R// The Sign of Three con una duración de 93 min.

#

