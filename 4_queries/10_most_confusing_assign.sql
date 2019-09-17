SELECT assignments.id, assignments.name, assignments.day, assignments.chapter, COUNT(req.*) AS total_counts
FROM assignments
JOIN assistance_requests req ON req.assignment_id = assignments.id
GROUP BY assignments.id
ORDER BY total_counts DESC;