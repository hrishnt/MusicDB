# Design Document

Hrishant Shiwakoti Sharma


## Scope

The database for the music platform includes all entities necessary to facilitate tracking artists, albums, songs, users, and playlists. The database's scope includes:

Artists: Tracks information about musical artists.
Albums: Contains albums related to specific artists.
Songs: Stores individual songs, their duration, and their relationship to albums and artists.
Users: Represents users who can create playlists.
Playlists: Contains the playlists created by users, with songs added to them.
Out of scope are elements like ratings, user comments on songs, and other non-core attributes.

## Functional Requirements

This database will support:

CRUD operations for artists, albums, songs, users, and playlists.
Users can create playlists, and songs can be added to playlists.
A user can have multiple playlists, and playlists can contain many songs.
An artist can have multiple albums, and an album can have multiple songs.
CRUD operations will also be required for artists, albums, songs, and playlists.


## Representation
Entities are captured in SQLite tables with the following schema.


### Entities

The database includes the following entities:

Artists
The artists table includes:

artist_id: Specifies the unique ID for the artist as an INTEGER. This column has the PRIMARY KEY constraint applied.
name: Specifies the name of the artist as TEXT.
genre: Specifies the genre of the artist as TEXT.
Albums
The albums table includes:

album_id: Specifies the unique ID for the album as an INTEGER. This column has the PRIMARY KEY constraint applied.
title: Specifies the album title as TEXT.
artist_id: Specifies the ID of the artist who created the album. It is a foreign key referencing the artist_id in the artists table.
Songs
The songs table includes:

song_id: Specifies the unique ID for the song as an INTEGER. This column has the PRIMARY KEY constraint applied.
title: Specifies the title of the song as TEXT.
duration: Specifies the duration of the song in seconds as INTEGER.
album_id: Specifies the album to which the song belongs. It is a foreign key referencing the album_id in the albums table.
artist_id: Specifies the artist of the song. It is a foreign key referencing the artist_id in the artists table.
Users
The users table includes:

user_id: Specifies the unique ID for the user as an INTEGER. This column has the PRIMARY KEY constraint applied.
username: Specifies the username of the user as TEXT.
email: Specifies the email address of the user as TEXT. This column is unique.
Playlists
The playlists table includes:

playlist_id: Specifies the unique ID for the playlist as an INTEGER. This column has the PRIMARY KEY constraint applied.
name: Specifies the name of the playlist as TEXT.
user_id: Specifies the user who created the playlist. It is a foreign key referencing the user_id in the users table.
Playlist_Songs
The playlist_songs table includes:

playlist_id: Specifies the ID of the playlist. This column has the FOREIGN KEY constraint applied, referencing the playlist_id in the playlists table.
song_id: Specifies the ID of the song. This column has the FOREIGN KEY constraint applied, referencing the song_id in the songs table.
This table represents a many-to-many relationship between playlists and songs.


### Relationships

As detailed by the schema:

One artist can have multiple albums, and each album is associated with only one artist.
One album can have multiple songs, and each song belongs to only one album.
One song can have one artist but can be part of only one album at a time.
One user can create multiple playlists, and each playlist belongs to a single user.
One playlist can contain multiple songs, and a song can appear in multiple playlists.


## Optimizations

For typical queries, it’s common to search for all songs by a specific artist or album. For these reasons, we create indexes on the name column of the artists, albums, and songs tables to speed up searching by name.

Similarly, it’s important for users to quickly view their playlists and the songs they contain, so indexes are created on the user_id in the playlists table and the playlist_id in the playlist_songs table.

## Limitations

This schema assumes that songs are added to playlists by users and that users interact with playlists individually. Collaborative playlist creation and sharing between users would require a more complex many-to-many relationship between users and playlists.


