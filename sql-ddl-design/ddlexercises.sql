
DROP DATABASE IF EXISTS ddl_exercises;

CREATE DATABASE ddl_exercises;

\c ddl_exercises

-- PART ONE medical center ------------------------------------

CREATE TABLE medcenters(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    symptoms TEXT 
);

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT,
    field TEXT,
    location INTEGER REFERENCES medcenters ON DELETE CASCADE
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT
);

CREATE TABLE doctors_patients(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE patients_diseases(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

---------------------------------------------------------------

-- PART TWO Craigslist ----------------------------------------

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    topic TEXT NOT NULL
);

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(32) NOT NULL,
    prefered_region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT,
    location TEXT,
    poster INTEGER REFERENCES users ON DELETE CASCADE,
    region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE posts_categories(
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    cat_id INTEGER REFERENCES categories ON DELETE SET NULL
);

---------------------------------------------------------------

-- PART 3 soccer league ---------------------------------------

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE plays_for(
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE CASCADE,
    team INTEGER REFERENCES teams ON DELETE CASCADE,
    season INTEGER REFERENCES seasons ON DELETE CASCADE
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams ON DELETE CASCADE,
    team2 INTEGER REFERENCES teams ON DELETE CASCADE,
    winner INTEGER REFERENCES teams ON DELETE CASCADE, --NULL on ties?
    score TEXT NOT NULL,
    referee INTEGER REFERENCES referees ON DELETE SET NULL,
    season INTEGER REFERENCES seasons ON DELETE CASCADE
);

CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE SET NULL,
    match INTEGER REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE standings(
    id SERIAL PRIMARY KEY,
    team INTEGER REFERENCES teams ON DELETE CASCADE,
    season INTEGER REFERENCES seasons ON DELETE CASCADE,
    placement INTEGER NOT NULL
);

---------------------------------------------------------------