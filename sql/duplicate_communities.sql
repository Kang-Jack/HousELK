SELECT 
    title, district, COUNT(*)
FROM
    house.community
GROUP BY title
HAVING COUNT(*) > 1