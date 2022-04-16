DROP TABLE IF EXISTS lec_2.emp;
DROP TABLE IF EXISTS lec_2.pay;
DROP TABLE IF EXISTS lec_2.unis;


CREATE TABLE lec_2.pay
(title VARCHAR(20) NOT NULL PRIMARY KEY,
sal INT NOT NULL
);

INSERT INTO lec_2.pay VALUES('Mech. Eng.',27000);
INSERT INTO lec_2.pay VALUES('Programmer',24000);
INSERT INTO lec_2.pay VALUES('Elect. Eng.',40000);
INSERT INTO lec_2.pay VALUES('Syst. Ana.',34000);

CREATE TABLE lec_2.emp
(eno INT NOT NULL PRIMARY KEY,
ename VARCHAR(20) NOT NULL,
title VARCHAR(20) NOT NULL,
FOREIGN KEY (title) REFERENCES pay(title)
);

INSERT INTO lec_2.emp VALUES(1,'J. Doe','Elect. Eng.');
INSERT INTO lec_2.emp VALUES(2,'M. Smith','Syst. Ana.');
INSERT INTO lec_2.emp VALUES(3,'A. Lee','Mech. Eng.');
INSERT INTO lec_2.emp VALUES(4,'J. Miller','Programmer');
INSERT INTO lec_2.emp VALUES(5,'B. Casey','Syst. Ana.');
INSERT INTO lec_2.emp VALUES(6,'L. Chu','Elect. Eng.');
INSERT INTO lec_2.emp VALUES(7,'R. Davis','Mech. Eng.');
INSERT INTO lec_2.emp VALUES(8,'J. Jones','Syst. Ana.');

Delete from lec_2.emp where lec_2.emp.eno=1;
Delete from lec_2.emp where lec_2.emp.eno=6;

INSERT INTO lec_2.emp VALUES(9,'Haris','Teacher');


CREATE TABLE lec_2.unis 
(name VARCHAR(40) NOT NULL PRIMARY KEY,
city VARCHAR(20),
region VARCHAR(20),
students INT,
founded INT
);
INSERT INTO lec_2.unis VALUES("University of Cambridge", "Cambridge", "East", "18448", "1209");
INSERT INTO lec_2.unis VALUES("UCLAN", "Preston", "North West", "32040", "1992");
INSERT INTO lec_2.unis VALUES("Lancaster University", "Lancaster", "North West", "12525", "1964");
INSERT INTO lec_2.unis VALUES("University of Manchester", "Manchester", "North West", "39165", "1824");
INSERT INTO lec_2.unis VALUES("Manchester Met", "Manchester", "North West", "37000", "1992");
INSERT INTO lec_2.unis VALUES("The Open University", NULL, NULL, "253075", "1969");
INSERT INTO lec_2.unis VALUES("University of Oxford", "Oxford", "South East", "22116", NULL);
INSERT INTO lec_2.unis VALUES("Oxford Brookes University", "Oxford", "South East", "18425", "1992");
INSERT INTO lec_2.unis VALUES("University of York", "York", "North East", "15265", "1963");