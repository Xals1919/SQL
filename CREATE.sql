CREATE TABLE IF NOT EXISTS genre (
	id_genre INT PRIMARY KEY,
	full_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS executor (
	id_executor INT PRIMARY KEY,
	full_name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS album (
	id_album INT PRIMARY KEY,
	full_name VARCHAR(60) NOT NULL,
	year_issue DECIMAL(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS track (
	id_track INT PRIMARY KEY,
	full_name VARCHAR(60) NOT NULL,
	duration INT NOT NULL,
	id_album INT NOT NULL REFERENCES album(id_album)
);

CREATE TABLE IF NOT EXISTS tracklist (
	id_tracklist INT PRIMARY KEY,
	full_name VARCHAR(60) NOT NULL,
	year_issue DECIMAL(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_executor (
	id_genre_executor INT PRIMARY KEY,
	id_genre INT NOT NULL REFERENCES genre(id_genre),
	id_executor INT NOT NULL REFERENCES executor(id_executor)
);

CREATE TABLE IF NOT EXISTS executor_album (
	id_executor_album INT PRIMARY KEY,
	id_executor INT NOT NULL REFERENCES executor(id_executor),
	id_album INT NOT NULL REFERENCES album(id_album)
);

CREATE TABLE IF NOT EXISTS track_tracklist (
	id_track_tracklist INT PRIMARY KEY,
	id_track INT NOT NULL REFERENCES track(id_track),
	id_tracklist INT NOT NULL REFERENCES tracklist(id_tracklist)
);