SELECT
    t.request_at AS Day,
    ROUND(
        AVG(
            CASE
                WHEN t.status IN ('cancelled_by_client', 'cancelled_by_driver')
                THEN 1.00
                ELSE 0.00
            END
        ),
        2
    ) AS `Cancellation Rate`
FROM Trips t
JOIN Users c
    ON t.client_id = c.users_id
JOIN Users d
    ON t.driver_id = d.users_id
WHERE c.banned = 'No'
  AND d.banned = 'No'
  AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at;
