/*============ Creation d'une DATABASE library2 ==================*/
/*================================================================*/

CREATE DATABASE library2 ; 
DROP DATABASE IF EXISTS library;

USE library2 ;


/*============creation de la table Jobs ==================*/

DROP TABLE IF EXISTS Jobs ;  

CREATE TABLE Jobs (
	job_id TINYINT NOT NULL AUTO_INCREMENT ,   /* PRIMARY KEY */
    job_desc VARCHAR(50) UNIQUE NOT NULL ,
    min_lvl ENUM('Stagiaire','Junior','Intermidiaire','Seinior') NULL,
    max_lvl ENUM('Stagiaire','Junior','Intermidiaire','Seinior') NULL ,
    CONSTRAINT PK_jobs PRIMARY KEY(job_id)
	/*CONSTRAINT uniq_job_desc UNIQUE(JOB_DESC) */ 
    
) ;

/*============creation de la table publishers ==================*/

DROP TABLE IF EXISTS Publishers ;
CREATE TABLE Publishers (
	pub_id TINYINT NOT NULL PRIMARY KEY,
    pub_name VARCHAR(50) UNIQUE ,
    city VARCHAR(50) ,
    state VARCHAR(50) NULL ,
    country VARCHAR(50) ,
    email VARCHAR(50),
    CONSTRAINT check_email CHECK (email LIKE '%@%'),  /* pour assurer que chaque email contient @ */
    CONSTRAINT unique_email UNIQUE (email)  /* Assure l'unicité de l'email */
) ;

/*============creation de la table Employees ==================*/


DROP TABLE IF EXISTS Employees ;

CREATE TABLE Employees (
	emp_id TINYINT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(50) ,
	salary SMALLINT  ,
    fname VARCHAR(50) ,
    lname VARCHAR(50) ,
    job_id TINYINT NOT NULL REFERENCES Jobs(job_id),  /* on doit mettre le meme type */ 
    pub_id TINYINT NOT NULL REFERENCES Publishers(pub_id) ,
    hire_date DATE ,
    email VARCHAR(50) ,
    CONSTRAINT check_email1 CHECK (email LIKE '%@%'),  /* pour assurer que chaque email contient @ */
    CONSTRAINT unique_email1 UNIQUE (email)  /* Assure l'unicité de l'email */
) ;

/*============creation de la table Authors ==================*/


DROP TABLE IF EXISTS Authors ;

CREATE TABLE Authors (
au_id TINYINT NOT NULL PRIMARY KEY,
au_lname VARCHAR(50) ,
au_fname VARCHAR(50) ,
phone VARCHAR(20) ,
address VARCHAR(50) ,
city VARCHAR(50) ,
state VARCHAR(50) NULL,
country VARCHAR(50) ,
zip  VARCHAR(6) ,
contact TEXT ,
email  VARCHAR(50) ,
CONSTRAINT check_email2 CHECK (email LIKE '%@%'),  /* pour assurer que chaque email contient @ */
CONSTRAINT unique_email2 UNIQUE (email) , /* Assure l'unicité de l'email */
CONSTRAINT check_phone CHECK (phone RLIKE '^\+[0-9]{10,15}$') , /* pour assuer que le num commence par + suivi de 10 a 15 chiffres * de 0 a 9 */
CONSTRAINT unique_phone UNIQUE (phone),
CONSTRAINT check_zip CHECK (zip RLIKE '^[A-Z][0-9][A-Z][0-9][A-Z][0-9]$') /* pour assuer que le zip ait la forme [chiffre NUM chiffre NUM chiffre NUM chiffre NUM ] */
);

/*============creation de la table Stores ==================*/

DROP TABLE IF EXISTS Stores ;

CREATE TABLE Stores (
stor_id TINYINT NOT NULL PRIMARY KEY,
stor_name VARCHAR(50) ,
stor_adress VARCHAR(50) ,
city VARCHAR(50) ,
state VARCHAR(50)  NULL , 
country VARCHAR(50) 
);

/*============creation de la table Titles ==================*/

DROP TABLE IF EXISTS Titles ;

CREATE TABLE Titles (
title_id TINYINT NOT NULL PRIMARY KEY,
title VARCHAR(50) ,
type_title ENUM ('Roman','Politique','Science','Histoire') NULL ,
pub_id TINYINT NOT NULL REFERENCES Publishers(pub_id) ,
price FLOAT ,
advance  FLOAT ,
notes VARCHAR(250) ,
pub_date DATE
);

/*============creation de la table Sales ==================*/

DROP TABLE IF EXISTS Sales ;

CREATE TABLE Sales (
store_id  TINYINT NOT NULL REFERENCES Stores(store_id) ,
ord_num TINYINT NOT NULL NOT NULL PRIMARY KEY ,
title_id TINYINT NOT NULL REFERENCES Titles(title_id) ,
ord_date DATETIME ,
qty INT 
);

/*============creation de la table Redactions ==================*/

DROP TABLE IF EXISTS Redactions ;

CREATE TABLE Redactions (
au_id TINYINT NOT NULL REFERENCES Authors(au_id) ,
title_id TINYINT NOT NULL REFERENCES Titles(title_id) ,
au_ord TINYINT ,
royalty FLOAT 
);









