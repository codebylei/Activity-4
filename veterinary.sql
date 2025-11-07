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

INSERT INTO animals (animalid, ownerid, name, species, breed, gender, age) VALUES
(1,1,'Whiskers','Cat','Persian','Female',2),
(2,2,'Buddy','Dog','Labrador','Male',3),
(3,3,'Simba','Cat','Siamese','Male',1),
(4,4,'Bella','Dog','Beagle','Female',4),
(5,5,'Max','Dog','Poodle','Male',2),
(6,6,'Milo','Cat','Bengal','Male',3),
(7,7,'Luna','Cat','Maine Coon','Female',1),
(8,8,'Rocky','Dog','Bulldog','Male',5),
(9,9,'Coco','Dog','Shih Tzu','Female',2),
(10,10,'Daisy','Cat','Ragdoll','Female',4);

INSERT INTO doctors (doctorid, firstname, lastname, specialization) VALUES
(1,'Sofia','Reyes','General Checkup'),
(2,'Miguel','Lopez','Dermatology'),
(3,'Carla','Dizon','Surgery'),
(4,'Antonio','Garcia','Dentistry'),
(5,'Rosa','Fernandez','Vaccination'),
(6,'Luis','Gomez','Eye Specialist'),
(7,'Marites','Santos','Internal Medicine'),
(8,'Jose','Torres','Orthopedic'),
(9,'Angela','Morales','Cardiology'),
(10,'Nina','Castro','Nutrition');
