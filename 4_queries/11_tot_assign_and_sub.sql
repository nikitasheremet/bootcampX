SELECT day, COUNT(name), SUM(duration)
FROM assignments
GROUP BY day
ORDER BY day;