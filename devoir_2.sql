-- question 1 
 
SELECT title, price
FROM titles
WHERE title LIKE '%computer%';

-- question 2

SELECT title, price
FROM titles
WHERE title LIKE '% computer %'
    OR title LIKE 'computer %'
    OR title LIKE '% computer'
    OR title = 'computer';

