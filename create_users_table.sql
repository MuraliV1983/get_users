
-- Create Database for Demo Purpose
CREATE DATABASE flask_pg_demo;

-- Drop the table if it exists
DROP TABLE IF EXISTS users;

-- Create the users table with a SERIAL primary key
CREATE TABLE users (
    user_id SERIAL,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(150) UNIQUE NOT NULL,
    user_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_USER_ID PRIMARY KEY (user_id)
);

-- Add a comment on the table
COMMENT ON TABLE users IS 'Stores user information for the Flask + PostgreSQL demo project.';

-- Add comments on individual columns
COMMENT ON COLUMN users.user_id IS 'Primary key: auto-incremented user ID.';
COMMENT ON COLUMN users.user_name IS 'Full name of the user.';
COMMENT ON COLUMN users.user_email IS 'Email address (must be unique).';
COMMENT ON COLUMN users.user_created IS 'Timestamp when the user was added.';

BEGIN;
-- Insert sample records
INSERT INTO users (user_name, user_email) VALUES
('E-Friend Murali', 'efriend@codes.com'),
('Learning Star', 'learn@fast.dev'),
('Postgres Pro', 'pg@devlab.io');
COMMIT;
