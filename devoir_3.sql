/*1 -La liste des paires (auteur, éditeur) demeurant dans la même ville.*/

SELECT au_fname AS auteur ,pub_name AS éditeur , authors.city as ville
FROM authors 
JOIN publishers ON authors.city=publishers.city ;


/*2 - La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant
aussi les auteurs qui ne répondent pas à ce critère. */

SELECT au_fname AS auteur ,pub_name AS éditeur , authors.city as ville_Auteur
FROM authors
LEFT JOIN publishers ON authors.city = publishers.city;

/*3 - La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant
aussi les éditeurs qui ne répondent pas à ce critère.*/ 

SELECT au_fname AS auteur ,pub_name AS éditeur , authors.city as ville_Editeur
FROM authors
RIGHT JOIN publishers ON authors.city = publishers.city;

/*4 - La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les
auteurs et les éditeurs qui ne répondent pas à ce critère. */

SELECT   au_fname, pub_name
FROM authors
left JOIN publishers ON authors.city = publishers.city 
union
SELECT   au_fname, pub_name
FROM authors
right JOIN publishers ON authors.city = publishers.city ;




/*5 - Effectif des employes par niveau d'experience*/

SELECT hire_date AS date_Embauche, COUNT(*) AS effectif
FROM employees
GROUP BY hire_date ORDER BY hire_date ;

/*6 - Liste des employes par maison d'edition*/

SELECT  DISTINCT employees.fname AS employes , publishers.pub_name AS maison_Edition
FROM employees
JOIN publishers ON employees.pub_id =  publishers.pub_id 
ORDER BY publishers.pub_name  ;

/* 7 - Salaires horaires moyens des employes par maison d'edition */ 

SELECT publishers.pub_name AS Maison_Edition ,
AVG (employees.salary) AS Salaire_Moyen 
FROM  employees 
JOIN publishers ON  employees.pub_id = publishers.pub_id 
GROUP BY publishers.pub_id ;

/* 8- Effectif des employee de niveau SEINIOR par maison d'edition */

SELECT  publishers.pub_id , publishers.pub_name , employees.job_lvl  , COUNT(employees.job_lvl) AS Effectif_niveau_SEINIOR 
FROM employees 
JOIN publishers ON employees.pub_id = publishers.pub_id
WHERE employees.job_lvl = 'SEINIOR' 
GROUP BY employees.pub_id ;













