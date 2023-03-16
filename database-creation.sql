-- Создание таблицы жанров
CREATE TABLE genres ( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL 
);

-- Создание таблицы для хранения актеров, композиторов и так далее 
CREATE TABLE people ( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL 
);

-- Создание таблицы для хранения ролей (главная или дублировали)
CREATE TABLE roles ( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL 
);

-- Создание таблицы фильмов
CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL,
    country VARCHAR(255) NOT NULL,
    tagline TEXT,
    plot TEXT,
    runtime INTERVAL,
    age_rating VARCHAR(10),
    mpaa_rating VARCHAR(10),
    budget NUMERIC(10, 2),
    marketing NUMERIC(10, 2),
    us_gross NUMERIC(10, 2),
    worldwide_gross NUMERIC(10, 2),
    director_id INTEGER,
    script_id INTEGER,
    producer_id INTEGER,
    cinematographer_id INTEGER,
    composer_id INTEGER,
    artist_id INTEGER,
    editing_id INTEGER,
    FOREIGN KEY (director_id) REFERENCES people(id),
    FOREIGN KEY (script_id) REFERENCES people(id),
    FOREIGN KEY (producer_id) REFERENCES people(id),
    FOREIGN KEY (cinematographer_id) REFERENCES people(id),
    FOREIGN KEY (composer_id) REFERENCES people(id),
    FOREIGN KEY (artist_id) REFERENCES people(id),
    FOREIGN KEY (editing_id) REFERENCES people(id)
);

-- Таблица многие ко многим для фильмов и жанров
CREATE TABLE films_genres ( 
    film_id INTEGER, 
    genre_id INTEGER, 
    FOREIGN KEY (film_id) REFERENCES films(id), 
    FOREIGN KEY (genre_id) REFERENCES genres(id), 
    PRIMARY KEY (film_id, genre_id) 
);

-- Создание таблицы, чтобы связать фильмы с людьми и их ролями (отношения "многие ко многим")
CREATE TABLE films_people_roles (
    film_id INTEGER,
    person_id INTEGER,
    role_id INTEGER,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id),
    PRIMARY KEY (film_id, person_id, role_id)
);

-- Создание таблицы для хранения зрителей по странам.
CREATE TABLE viewers ( 
    id SERIAL PRIMARY KEY, 
    country VARCHAR(255) NOT NULL, 
    viewers INTEGER NOT NULL, 
    film_id INTEGER REFERENCES films(id)
);