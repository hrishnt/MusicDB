--Inserting artists
INSERT INTO artists ("name", "genre")
VALUES ('The Beatles', 'Rock');

--Inserting Albums
INSERT INTO albums ("title", "artist_id")
VALUES ('Abbey Road', 1);  -- Assuming "The Beatles" has artist_id 1

--Inserting Songs
INSERT INTO songs ("title", "duration", "album_id", "artist_id")
VALUES ('Come Together', 259, 1, 1);  -- Assuming "Abbey Road" has album_id 1 and "The Beatles" has artist_id 1

--See all artist in the database
SELECT * FROM artists;

--All songs in a specific album
SELECT songs.title FROM songs
JOIN albums ON songs.album_id = albums.album_id
WHERE albums.title = 'Abbey Road';

--Updating songs
UPDATE songs
SET title = 'Something New'
WHERE song_id = 1;

--Deleting songs
DELETE FROM songs WHERE song_id = 1;

--Calculating total duration of songs
SELECT artists.name, COUNT(songs.song_id) AS song_count
FROM artists
JOIN songs ON artists.artist_id = songs.artist_id
GROUP BY artists.name;


