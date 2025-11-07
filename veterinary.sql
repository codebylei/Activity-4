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

CREATE TABLE doctors (
  doctorid INT PRIMARY KEY AUTO_INCREMENT,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  specialization VARCHAR(100)
);

CREATE TABLE appointments (
  appointid INT PRIMARY KEY AUTO_INCREMENT,
  animalid INT,
  doctorid INT,
  appointdate DATETIME,
  reason VARCHAR(100),
  FOREIGN KEY (animalid) REFERENCES animals(animalid),
  FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

CREATE TABLE invoices (
  invoiceid INT PRIMARY KEY AUTO_INCREMENT,
  appointid INT,
  totalamount DECIMAL(10,2),
  paymentdate TIME,
  FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
  recordid INT PRIMARY KEY AUTO_INCREMENT,
  animalid INT,
  recorddate DATETIME,
  doctorid INT,
  diagnosis VARCHAR(100),
  prescription VARCHAR(100),
  notes VARCHAR(255),
  FOREIGN KEY (animalid) REFERENCES animals(animalid),
  FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);
