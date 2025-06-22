CREATE TABLE IF NOT EXISTS teams(
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
)

CREATE TABLE IF NOT EXISTS games(
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR(100) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
    )


ALTER TABLE games
ADD CONSTRAINT fk_winner
FOREIGN KEY (winner_id)
REFERENCES teams(team_id);

ALTER TABLE games
ADD CONSTRAINT fk_opponent
FOREIGN KEY (opponent_id)
REFERENCES teams(team_id);


SELECT * FROM games;
