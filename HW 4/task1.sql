CREATE TABLE IF NOT EXISTS petPet (
  petname varchar(20) PRIMARY KEY,
  owner varchar(45),
  species varchar(45),
  gender enum('M','F'),
  birth date,
  death date
);

CREATE TABLE IF NOT EXISTS petEvent (
  petname varchar(20),
  eventdate date,
  eventtype varchar(15),
  remark varchar(255),
  FOREIGN KEY (petname) REFERENCES petPet (petname),
  PRIMARY KEY (petname, eventdate, eventtype)
);