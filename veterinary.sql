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

INSERT INTO appointments (appointid, animalid, doctorid, appointdate, reason) VALUES
(1,1,1,'2023-01-05 09:00:00','Checkup'),
(2,2,2,'2023-01-10 14:00:00','Vaccination'),
(3,3,3,'2023-02-02 11:00:00','Injury'),
(4,4,4,'2023-02-15 13:30:00','Dental Cleaning'),
(5,5,5,'2023-03-10 10:30:00','Skin Infection'),
(6,6,2,'2023-03-10 15:00:00','Flea Treatment'),
(7,7,5,'2023-04-12 09:00:00','Vaccination'),
(8,8,3,'2023-04-18 16:00:00','Spaying'),
(9,9,4,'2023-05-02 14:30:00','Allergy Check'),
(10,10,6,'2023-05-20 11:15:00','Eye Problem');

SELECT * FROM owners;
SELECT * FROM animals;
SELECT * FROM doctors;
SELECT * FROM appointments;

SHOW CREATE TABLE appointments;

INSERT INTO invoices (invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM appointments
WHERE animalid = (
  SELECT animalid FROM animals WHERE animalname = 'Simba'
);

UPDATE doctors
SET lastname = 'Reyes-Gonzales'
WHERE firstname = 'Sofia';

SELECT DISTINCT species
FROM animals;

SELECT SUM(totalamount) AS total_sales
FROM invoices;

SELECT COUNT(*) AS total_appointments
FROM appointments
WHERE ownerid = (
  SELECT ownerid FROM owners WHERE firstname = 'Maria'
);

SELECT a.animalname, COUNT(ap.appointid) AS total_appointments
FROM animals a
JOIN appointments ap ON a.animalid = ap.animalid
GROUP BY a.animalname
ORDER BY total_appointments DESC
LIMIT 1;
