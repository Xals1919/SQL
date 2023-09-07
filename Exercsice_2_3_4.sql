--Задание 2.1 Название и продолжительность самого длительного трека.
--Вариант 1
SELECT full_name, duration FROM track
ORDER BY duration DESC
LIMIT 1;

-- Вариант 2
SELECT full_name, duration FROM track
WHERE duration = (SELECT MAX(duration)FROM track);
 
-- Задание 2.2 Название треков, продолжительность которых не менее 3,5 минут.
SELECT full_name FROM track
WHERE duration >= 210;

--Задание 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT full_name FROM tracklist
WHERE year_issue BETWEEN 2018 AND 2021;

--Задание 2.4 Исполнители, чьё имя состоит из одного слова.
SELECT full_name FROM executor
WHERE full_name NOT LIKE '% %';

--Задание 2.5 Название треков, которые содержат слово «мой» или «my».
SELECT full_name FROM track
WHERE full_name iLIKE '%my%' OR full_name iLIKE '%мой%';

-- Задание 3.1 Количество исполнителей в каждом жанре.
SELECT g.full_name, COUNT(*) FROM genre g
JOIN genre_executor q ON g.id_genre = q.id_genre
JOIN executor e ON q.id_executor = e.id_executor
GROUP BY g.full_name
ORDER BY COUNT(*)DESC;
 
-- Задание 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT a.full_name, COUNT(*) FROM album a
JOIN track t ON t.id_album = a.id_album
WHERE year_issue BETWEEN 2019 AND 2021
GROUP BY a.full_name;
 
 -- Задание 3.3 Средняя продолжительность треков по каждому альбому.
SELECT a.full_name, ROUND(AVG(t.duration), 0) FROM album a
JOIN track t ON t.id_album = a.id_album
GROUP BY a.full_name
ORDER BY ROUND DESC;
 
--Задание 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT full_name FROM executor
WHERE full_name NOT IN(
	SELECT e.full_name FROM executor e
	JOIN executor_album ea ON ea.id_executor = e.id_executor 
	JOIN album a ON a.id_album = ea.id_album 
	WHERE year_issue = 2020
);

--Задание 3.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT t.full_name FROM tracklist t
JOIN track_tracklist tt ON tt.id_tracklist = t.id_tracklist
JOIN track tr ON tt.id_track = tr.id_track
JOIN album a ON tr.id_album = a.id_album
JOIN executor_album ea ON a.id_album = ea.id_album
JOIN executor ex ON ea.id_executor = ex.id_executor
WHERE ex.full_name = 'Nirvana';
 
 -- Задание 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.full_name FROM album a
WHERE a.full_name IN (
	SELECT a.full_name FROM album a
    JOIN executor_album ea ON a.id_album = ea.id_album
    JOIN executor ex ON ea.id_executor = ex.id_executor
    JOIN genre_executor ge ON ex.id_executor = ge.id_executor
    JOIN genre g ON ge.id_genre = g.id_genre
    GROUP BY a.full_name
    HAVING COUNT(g.full_name) > 1
);

--Задание 4.2 Наименования треков, которые не входят в сборники.
SELECT full_name FROM track 
WHERE full_name NOT IN(
	SELECT t.full_name FROM track t
	JOIN track_tracklist tt ON t.id_track = tt.id_track
	JOIN tracklist tr ON tt.id_tracklist = tr.id_tracklist
);

--Задание 4.3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT e.full_name FROM executor e
JOIN executor_album ea ON e.id_executor = ea.id_executor
JOIN album a ON ea.id_album = a.id_album 
JOIN track t ON a.id_album = t.id_album
GROUP BY e.full_name, t.duration
HAVING t.duration = (SELECT MIN(duration) FROM track)

--Задание 4.4 Названия альбомов, содержащих наименьшее количество треков.
SELECT a.full_name FROM album a
JOIN track t ON a.id_album = t.id_album 
WHERE t.id_album IN(
	SELECT id_album FROM track
	GROUP BY id_album 
	HAVING COUNT(id_album) = (
		SELECT COUNT(id_album) FROM track
		GROUP BY id_album 
		ORDER BY COUNT
		LIMIT 1
	)
)

