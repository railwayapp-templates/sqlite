-- Simple file to init the database with sample data --


-- Create a table with trains
CREATE TABLE trains (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  seats INTEGER NOT NULL
);

-- Insert some trains
INSERT INTO trains (name, seats) VALUES ('Thomas', 10);
INSERT INTO trains (name, seats) VALUES ('Gordon', 20);
INSERT INTO trains (name, seats) VALUES ('Percy', 30);
INSERT INTO trains (name, seats) VALUES ('Henry', 40);
