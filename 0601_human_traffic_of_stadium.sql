WITH HighTraffic AS (
    SELECT
        id,
        visit_date,
        people,
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
)
SELECT
    id,
    visit_date,
    people
FROM HighTraffic
WHERE grp IN (
    SELECT grp
    FROM HighTraffic
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date ASC;
