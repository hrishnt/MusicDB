-- Artist
CREATE TABLE artists(
    "artist_id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "genre" TEXT
);

-- Albums
CREATE TABLE albums(
    "album_id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL,
    "artist_id" INTEGER,
    FOREIGN KEY("artist_id") REFERENCES artists("artist_id")
);

-- Songs
CREATE TABLE songs(
    "song_id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL,
    "duration" INTEGER,  -- Duration in seconds
    "album_id" INTEGER,
    "artist_id" INTEGER NOT NULL,
    FOREIGN KEY ("album_id") REFERENCES albums("album_id") ON DELETE CASCADE,
    FOREIGN KEY ("artist_id") REFERENCES artists("artist_id") ON DELETE CASCADE
);

-- Users
CREATE TABLE users (
    "user_id" INTEGER PRIMARY KEY,
    "username" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL
);

-- Playlists
CREATE TABLE playlists(
    "playlist_id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    FOREIGN KEY("user_id") REFERENCES users("user_id")
);

-- Playlist_songs
CREATE TABLE playlist_songs(
    "playlist_id" INTEGER NOT NULL,
    "song_id" INTEGER NOT NULL,
    FOREIGN KEY("playlist_id") REFERENCES playlists("playlist_id"),
    FOREIGN KEY("song_id") REFERENCES songs("song_id")
);
