-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE mother
(
	     qcid                   INTEGER         NOT NULL
	    ,dateofbirth            DATE            NOT NULL
	    ,phonenum               VARCHAR(30)     NOT NULL
	    ,email                  VARCHAR(30)     NOT NULL
	    ,profession             VARCHAR(30)     NOT NULL
	    ,name                   VARCHAR(30)     NOT NULL
	    ,adress                 VARCHAR(30)     NOT NULL
	    ,bloodtype              VARCHAR(30)
	    ,UNIQUE(email)
	    ,PRIMARY KEY(qcid)
);

CREATE TABLE father
(
	     id             INTEGER          NOT NULL
	    ,qcid           INTEGER
	    ,dateofbirth    DATE             NOT NULL
	    ,phonenum       VARCHAR(30)      NOT NULL
	    ,email          VARCHAR(30)
	    ,profession     VARCHAR(30)      NOT NULL
	    ,name           VARCHAR(30)      NOT NULL
	    ,bloodtype      VARCHAR(30)
	    ,PRIMARY KEY(id)
);

CREATE TABLE couple
(
	     coupleid        INTEGER    NOT NULL
	    ,isinterested    BOOLEAN    NOT NULL
	    ,isChosen        BOOLEAN    NOT NULL
	    ,isQualified     BOOLEAN    NOT NULL
	    ,qcid            INTEGER    NOT NULL
	    ,id              INTEGER
	    ,FOREIGN KEY (qcid) references mother(qcid)
	    ,FOREIGN KEY (id) references father(id)
	    ,PRIMARY KEY (coupleid)
);

CREATE TABLE institution(
	     email      VARCHAR(30)     NOT NULL
	    ,name       VARCHAR(30)     NOT NULL
	    ,number     VARCHAR(30)     NOT NULL
	    ,website    VARCHAR(30)     NOT NULL
	    ,address    VARCHAR(30)     NOT NULL
	    ,PRIMARY KEY (email)
);

CREATE TABLE birthingcenter(
	     email       VARCHAR(30)    NOT NULL
	    ,FOREIGN KEY(email) references institution(email)
	    ,PRIMARY KEY (email)
);

CREATE TABLE communityclinic(
	     email       VARCHAR(30)     NOT NULL
	    ,FOREIGN KEY(email) references institution(email)
	    ,PRIMARY KEY  (email)
);

CREATE TABLE midwife(
	     practid        INTEGER             NOT NULL
	    ,email          VARCHAR(30)         NOT NULL
	    ,name           VARCHAR(30)         NOT NULL
	    ,number         VARCHAR(30)         NOT NULL
	    ,bemail         VARCHAR(30)         NOT NULL
	    ,FOREIGN KEY(bemail) references institution(email)
	    ,PRIMARY KEY(practid)
);

CREATE TABLE pregnancy
(
	     coupleid               INTEGER         NOT NULL
	    ,pregnancynumber        INTEGER         NOT NULL
	    ,initialduedate         DATE
	    ,duedateultrasound      DATE
	    ,ishomebirth            BOOLEAN
	    ,finalduedate           DATE
	    ,duedatemenstrual       DATE
	    ,practid                INTEGER         NOT NULL
	    ,bpractid               INTEGER
	    ,email                  VARCHAR(30)
	    ,FOREIGN KEY(coupleid) references couple(coupleid)
	    ,FOREIGN KEY(practid) references midwife(practid)
	    ,FOREIGN KEY(bpractid) references midwife(practid)
	    ,FOREIGN KEY(email) references birthingcenter(email)
	    ,PRIMARY KEY (coupleid, pregnancynumber)
);


CREATE TABLE child
(
	     dateofbirth        DATE        NOT NULL
	    ,timeOfBirth        TIME        NOT NULL
	    ,coupleid           INTEGER     NOT NULL
	    ,pregnancynumber    INTEGER     NOT NULL
	    ,name               VARCHAR(30)
	    ,gender             VARCHAR(30)
	    ,FOREIGN KEY(coupleid, pregnancynumber) references pregnancy(coupleid, pregnancynumber)
	    ,PRIMARY KEY(dateofbirth, timeOfBirth, coupleid, pregnancynumber)
);


CREATE TABLE infosession(
	     sessionid      INTEGER             NOT NULL
	    ,date           DATE                NOT NULL
	    ,time           TIME                NOT NULL
	    ,language       VARCHAR(30)
	    ,practid        INTEGER
	    ,FOREIGN KEY(practid) references midwife(practid)
	    ,PRIMARY KEY(sessionid)
);

CREATE TABLE technician(
	     techid         INTEGER         NOT NULL
	    ,name           VARCHAR(30)     NOT NULL
	    ,phonenum       VARCHAR(30)     NOT NULL
	    ,PRIMARY KEY (techid)
);

CREATE TABLE appointment(
	     appointmentid      INTEGER         NOT NULL
	    ,practid            INTEGER         NOT NULL
	    ,coupleid           INTEGER
	    ,pregnancynumber    INTEGER
	    ,date               DATE            NOT NULL
	    ,time               TIME            NOT NULL
	    ,FOREIGN KEY(practid) references midwife(practid)
	    ,FOREIGN KEY(coupleid, pregnancynumber) references pregnancy(coupleid, pregnancynumber)
	    ,PRIMARY KEY (appointmentid)
);

CREATE TABLE note(
	     date               DATE        NOT NULL
	    ,time               TIME        NOT NULL
	    ,appointmentid      INTEGER     NOT NULL
	    ,FOREIGN KEY(appointmentid) references appointment(appointmentid)
	    ,PRIMARY KEY (date, time, appointmentid)
);

CREATE TABLE medicaltest(
	     testid             INTEGER         NOT NULL
	    ,datetaken          DATE            NOT NULL
	    ,result             VARCHAR(30)     NOT NULL
	    ,dateprescribed     DATE            NOT NULL
	    ,type               VARCHAR(30)     NOT NULL
	    ,date               DATE            NOT NULL
	    ,coupleid           INTEGER         NOT NULL
	    ,pregnancynumber    INTEGER         NOT NULL
	    ,practid            INTEGER
	    ,techid             INTEGER
	    ,dateofbirth        DATE
	    ,timeOfBirth        TIME
	    ,FOREIGN KEY(coupleid,pregnancynumber) references pregnancy(coupleid,pregnancynumber)
	    ,FOREIGN KEY(practid) references midwife(practid)
	    ,FOREIGN KEY(techid) references technician(techid)
	    ,FOREIGN KEY(dateofbirth, timeOfBirth, coupleid, pregnancynumber) references child(dateofbirth, timeOfBirth, coupleid, pregnancynumber)
	    ,PRIMARY KEY (testid)
);


CREATE TABLE invites(
	     email              VARCHAR(30)     NOT NULL
	    ,coupleid           INTEGER         NOT NULL
	    ,practid            INTEGER         NOT NULL
	    ,ifregistered       BOOLEAN         NOT NULL
	    ,ifattended         BOOLEAN         NOT NULL
	    ,FOREIGN KEY(email) references institution(email)
	    ,FOREIGN KEY(coupleid) references couple(coupleid)
	    ,FOREIGN KEY(practid) references midwife(practid)
	    ,PRIMARY KEY (email, coupleid, practid)
);


