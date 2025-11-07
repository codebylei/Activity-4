CREATE DATABASE veterinary;

CREATE TABLE owners (
  ownerid INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  address VARCHAR(100),
  contactnumber VARCHAR(20)
);
