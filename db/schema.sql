-- File: db/schema.sql

-- Create the database (optional in some setups)
CREATE DATABASE IF NOT EXISTS ComplaintMngSystem;
USE ComplaintMngSystem;

-- Drop existing tables if they exist (for clean imports)
DROP TABLE IF EXISTS complaint;
DROP TABLE IF EXISTS users;

-- Users Table
CREATE TABLE users (
                       id VARCHAR(50) PRIMARY KEY,
                       name VARCHAR(25),
                       email VARCHAR(50),
                       password VARCHAR(25),
                       role VARCHAR(20)
);

-- Complaints Table
CREATE TABLE complaint (
                           cid VARCHAR(50) PRIMARY KEY,
                           subject VARCHAR(50) NOT NULL,
                           description VARCHAR(255),
                           status VARCHAR(25) DEFAULT 'pending',
                           user_id VARCHAR(50),
                           complaint_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                           FOREIGN KEY (user_id) REFERENCES users(id)
                               ON DELETE CASCADE
                               ON UPDATE CASCADE
);
