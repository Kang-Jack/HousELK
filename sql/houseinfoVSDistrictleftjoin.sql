SELECT 
    COUNT(*), community.district
FROM
    houseinfo
        LEFT JOIN
    community ON houseinfo.community = community.title
GROUP BY community.district