-- Simple file to init the database with sample data --


-- Create a table with trains
CREATE TABLE trains (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  seats INTEGER NOT NULL
);

-- Insert some trains
INSERT INTO trains (id, name, seats) VALUES (1, 'Thomas', 10);
INSERT INTO trains (id, name, seats) VALUES (2, 'Gordon', 20);
INSERT INTO trains (id, name, seats) VALUES (3, 'Percy', 30);
INSERT INTO trains (id, name, seats) VALUES (4, 'Henry', 40);
