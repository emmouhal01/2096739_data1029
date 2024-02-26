-- question 1 À partir de la table « titles », obtenir la liste des titres contenant 
-- le mot « computer » Afficher le titre et le prix de chaque livre.
 
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- question 2 À partir de la table « titles », obtenir la liste des titres contenant le mot « computer » (au
-- singulier). Afficher le titre et le prix de chaque livre.


SELECT title, price
FROM titles
WHERE title LIKE '% computer %'
    OR title LIKE 'computer %'
    OR title LIKE '% computer'
    OR title = 'computer';

-- question 3 À partir de la table « titles », obtenir la liste des titres dont l’identifiant débute par SU ou BU.
-- Afficher le titre et le prix de chaque livre.


SELECT title, price
FROM titles
WHERE title_id LIKE 'SU%' OR title_id LIKE 'BU%';

-- question 4 À partir de la table « titles », obtenir la liste des titres dont l’identifiant ne débute pas par SU ou BU. Afficher 
-- le titre et le prix de chaque livre.

SELECT title, price
FROM titles
WHERE title_id NOT LIKE 'SU%' AND title_id NOT LIKE 'BU%';

-- question 5 À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la seconde lettre
-- est « o ». Afficher le titre et le prix.

SELECT title, price
FROM titles
WHERE title NOT RLIKE '^[SB]' 
    AND title LIKE '_o%';

-- question 6 À partir de la table « titles », obtenir la liste des titres ne débutant ni par S, ni par B, mais dont la 3ème lettre 
-- est « f ». Afficher le titre et le prix.

SELECT title, price
FROM titles
WHERE title NOT RLIKE '^[SB]' 
    AND title LIKE '__f%';
    
-- question 7 À partir de la table « titles », obtenir la liste des titres débutant par l’une des 10 premières
-- lettres de l’alphabet. Afficher le titre et le prix


SELECT title, price
FROM titles
WHERE title RLIKE '^[A-J]';



