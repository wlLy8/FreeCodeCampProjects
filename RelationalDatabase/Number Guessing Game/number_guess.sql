CREATE DATABASE number_guess;

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(22) UNIQUE NOT NULL
);

CREATE TABLE games(
    game_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    number_of_guesses INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);