-- psql < craigslist.sql
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_name TEXT UNIQUE NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    pref_reg_id INTEGER REFERENCES regions
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY, 
    cat_name TEXT
);


CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);
