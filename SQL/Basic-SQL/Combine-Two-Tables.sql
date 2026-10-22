-- Problem: Combine Two Tables
-- Platform: LeetCode
-- Topic: LEFT JOIN
-- Difficulty: Easy

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;
