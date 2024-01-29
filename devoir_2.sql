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

-- question 3

SELECT title, price
FROM titles
WHERE title_id LIKE 'SU%' OR title_id LIKE 'BU%';

-- question 4

SELECT title, price
FROM titles
WHERE title_id NOT LIKE 'SU%' AND title_id NOT LIKE 'BU%';

-- question 5

SELECT title, price
FROM titles
WHERE title NOT RLIKE '^[SB]' 
    AND title LIKE '_o%';

-- question 6

SELECT title, price
FROM titles
WHERE title NOT RLIKE '^[SB]' 
    AND title LIKE '__f%';


