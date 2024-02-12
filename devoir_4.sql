/*1 - Obtenir la liste des auteurs dont l’éditeur « Harmattan » n’a publié aucun livre */

SELECT DISTINCT au.au_id, au.au_fname, au.au_lname
FROM authors au
LEFT JOIN titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
LEFT JOIN publishers p ON t.pub_id = p.pub_id
WHERE p.pub_name != 'Harmattan' OR p.pub_name IS NULL;

SELECT DISTINCT au.au_id, au.au_fname, au.au_lname
FROM authors au
WHERE au.au_id NOT IN (
    SELECT DISTINCT ta.au_id
    FROM titleauthor ta
    JOIN titles t ON ta.title_id = t.title_id
    JOIN publishers p ON t.pub_id = p.pub_id
    WHERE p.pub_name = 'Harmattan'
);


/*2 - Obtenir la liste des auteurs dont l’éditeur «Eyrolles » a publié tous les livres */

SELECT DISTINCT au.au_id, au.au_fname, au.au_lname
FROM authors au
WHERE au.au_id NOT IN (
    SELECT DISTINCT ta.au_id
    FROM titleauthor ta
    JOIN titles t ON ta.title_id = t.title_id
    JOIN publishers p ON t.pub_id = p.pub_id
    WHERE p.pub_name != 'Eyrolles'
);



/*3 - Obtenir la liste des noms d’auteurs ayant touché une avance supérieure à toutes les
avances versées par l'éditeur "Harmattan". */

SELECT DISTINCT au.au_fname, au.au_lname
FROM authors au
JOIN titleauthor ta ON au.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
WHERE t.advance > (
    SELECT MAX(t.advance)
    FROM titles t
    JOIN publishers p ON t.pub_id = p.pub_id
    WHERE p.pub_name = 'Harmattan'
);
