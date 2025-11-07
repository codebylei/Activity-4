CREATE DATABASE veterinary;

CREATE TABLE owners (
  ownerid INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  address VARCHAR(100),
  contactnumber VARCHAR(20)
);

CREATE TABLE animals (
  animalid INT PRIMARY KEY AUTO_INCREMENT,
  ownerid INT,
  name VARCHAR(50),
  species VARCHAR(50),
  breed VARCHAR(50),
  gender VARCHAR(10),
  age INT,
  FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);
