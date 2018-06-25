SELECT 
    COUNT(*), community.district
FROM
    rentinfo
        Left JOIN
    community ON rentinfo.region = community.title
GROUP BY community.district