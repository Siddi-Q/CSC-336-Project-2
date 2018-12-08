CREATE TABLE `patient` (
  `SSN` varchar(11) NOT NULL,
  `patientName` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `emergencyContactNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`));
  
  
  CREATE TABLE `emergencycontact` (
  `SSN` varchar(11) NOT NULL,
  `contactName` varchar(255) NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `FK_SSN` FOREIGN KEY (`SSN`) REFERENCES `patient` (`SSN`));
 
 
CREATE TABLE `diagnosisname` (
  `diagnosisID` varchar(255) NOT NULL,
  `diagnosisName` varchar(255) NOT NULL,
  PRIMARY KEY (`diagnosisID`));
  
  
CREATE TABLE `drugtreatmentname` (
  `drugId` varchar(255) NOT NULL,
  `drugName` varchar(255) NOT NULL,
  PRIMARY KEY (`drugId`));
  
  
CREATE TABLE `surgeryname` (
  `surgeryID` varchar(255) NOT NULL,
  `surgeryName` varchar(255) NOT NULL,
  PRIMARY KEY (`surgeryID`));
  
  
CREATE TABLE `patientrecord` (
  `SSN` varchar(11) NOT NULL,
  `admissionDate` date NOT NULL,
  `releaseDate` date DEFAULT NULL,
  `fees` int DEFAULT NULL,
  PRIMARY KEY (`SSN`,`admissionDate`),
  CONSTRAINT `FK_PRSSN` FOREIGN KEY (`SSN`) REFERENCES `patient` (`ssn`));
  
  
  CREATE TABLE `patientdiagnosis` (
  `SSN` varchar(11) NOT NULL,
  `diagnosisID` varchar(255) NOT NULL,
  `dateOfDiagnosis` date NOT NULL,
  PRIMARY KEY (`SSN`,`diagnosisID`, `dateofDiagnosis`),
  CONSTRAINT `FK_PDSSN` FOREIGN KEY (`SSN`) REFERENCES `patient` (`ssn`));
  

  CREATE TABLE `patientdrugtreatment` (
  `SSN` varchar(11) NOT NULL,
  `diagnosisID` varchar(255) NOT NULL,
  `drugId` varchar(255) DEFAULT NULL,
  `datePrescribed` date NOT NULL,
  PRIMARY KEY (`SSN`,`diagnosisID`, `datePrescribed`),
  CONSTRAINT `FK_PDRSSN` FOREIGN KEY (`SSN`) REFERENCES `patient` (`ssn`),
  CONSTRAINT `FK_PDRDIAGID` FOREIGN KEY (`diagnosisID`) REFERENCES `diagnosisname`(`diagnosisID`));
  
  
  CREATE TABLE `patientsurgery` (
  `SSN` varchar(11) NOT NULL,
  `surgeryID` varchar(255) NOT NULL,
  `beginDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `results` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SSN`,`surgeryID`),
  CONSTRAINT `FK_PSSSN` FOREIGN KEY (`SSN`) REFERENCES `patient` (`ssn`));
  
  

  
  
  
