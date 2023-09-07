INSERT INTO genre
    VALUES
    (1, 'Rock'),
    (2, 'Punk'),
    (3, 'Pop music');

   INSERT INTO executor
    VALUES 
    (1, 'Nirvana'),
    (2, 'Linkin Park'),
    (3, 'Green day'),
    (4, 'Lady Gaga');

INSERT INTO album
    VALUES
    (1, 'Bleach', '1989'),
    (2, 'Meteora', '2020'),
    (3, 'Nimrod', '1997'),
    (4, 'Joanne', '2019'),
    (5, 'Sun', '2020');

INSERT INTO track
    VALUES
    (1, 'Hey Girl', '180', '1'),
    (2, 'Numb', '230', '2'),
    (3, 'In the End', '233', '2'),
    (4, 'My faint', '197', '3'),
    (5, 'Good Goodbye', '212', '4'),
    (6, 'Invisible', '223', '4'),
    (7, 'Sharp Edges', '185', '5'),
    (8, 'Yezzy', '190', '5');

INSERT INTO genre_executor
    VALUES 
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 3),
    (5, 3, 3),
    (6, 3, 4);

INSERT INTO executor_album
    VALUES 
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 3, 4),
    (5, 4, 1),
    (6, 4, 2),
    (7, 4, 5);

INSERT INTO tracklist
    VALUES 
    (1, 'Fire', '2004'),
    (2, 'Song', '2006'),
    (3, 'Hit', '2003'),
    (4, 'Luck', '2020'),
    (5, 'Trip', '2022'),
    (6, 'Euro', '2023');

INSERT INTO track_tracklist
    VALUES 
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3),
    (4, 3, 3),
    (5, 4, 4),
    (6, 4, 5),
    (7, 5, 5),
    (8, 6, 6),
    (9, 7, 6);