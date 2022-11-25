CREATE TABLE IF NOT EXISTS measurements (
    measurementid INT AUTO_INCREMENT PRIMARY KEY,
    sensorid VARCHAR(255) NOT NULL,
    temperature DOUBLE,
    humidity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB



SELECT * FROM measurements


INSERT INTO measurements (sensorid, temperature, humidity) VALUES ('a1b3', 22.1, 55)


