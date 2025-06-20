CREATE TABLE IF NOT EXISTS teams(
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
)

CREATE TABLE IF NOT EXISTS games(
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR(10) NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
    )
