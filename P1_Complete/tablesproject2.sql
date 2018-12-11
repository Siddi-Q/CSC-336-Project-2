CREATE TABLE `patient` (
  `ssn` VARCHAR(11) NOT NULL,
  `patientName` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(255) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `phoneNumber` VARCHAR(20) NOT NULL,
  `emergencyContactNumber` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ssn`));
  
  
CREATE TABLE `emergencycontact` (
  `ssn` VARCHAR(11) NOT NULL,
  `contactName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ssn`),
  CONSTRAINT `FK_SSN` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`));
 
  
CREATE TABLE `patientrecord` (
  `ssn` VARCHAR(11) NOT NULL,
  `admissionDate` DATE NOT NULL,
  `releaseDate` DATE NOT NULL,
  `fees` DOUBLE NOT NULL,
  PRIMARY KEY (`ssn`,`admissionDate`),
  CONSTRAINT `FK_PRSSN` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`));
  
  
CREATE TABLE `patientdiagnosis` (
  `diagnosisID` INT NOT NULL AUTO_INCREMENT,
  `ssn` VARCHAR(11) NOT NULL,
  `diagnosisName` VARCHAR(255) NOT NULL, 
  `dateOfDiagnosis` DATE NOT NULL,
  PRIMARY KEY (`diagnosisID`),
  CONSTRAINT `FK_PDSSN` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`), 
  CONSTRAINT `UQ_Patient/Diagnosis/Day` UNIQUE KEY (`SSN`,`diagnosisName`, `dateOfDiagnosis`));
  

CREATE TABLE `patientdrugtreatment` (
  `drugID` INT NOT NULL AUTO_INCREMENT,
  `ssn` VARCHAR(11) NOT NULL,
  `drugName` VARCHAR(255) NOT NULL,
  `datePrescribed` DATE NOT NULL,
  `diagnosisID` INT NOT NULL,
  PRIMARY KEY (`drugId`),
  CONSTRAINT `FK_PDRSSN` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`),
  CONSTRAINT `UQ_Patient/DrugTreatment/Day` UNIQUE KEY (`ssn`,`drugName`, `datePrescribed`),
  CONSTRAINT `FK_drugdiagnosis` FOREIGN KEY (`diagnosisID`) REFERENCES `patientdiagnosis` (`diagnosisID`));
  
  
CREATE TABLE `patientsurgery` (
  `surgeryID` INT NOT NULL AUTO_INCREMENT,
  `ssn` VARCHAR(11) NOT NULL,
  `surgeryName` VARCHAR(255) NOT NULL,
  `beginDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `result` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`surgeryID`),
  CONSTRAINT `FK_PSSSN` FOREIGN KEY (`ssn`) REFERENCES `patient` (`ssn`),
  CONSTRAINT `UQ_Patient/DrugTreatment/Day` UNIQUE KEY (`ssn`,`surgeryName`, `beginDate`));
  
  

  
