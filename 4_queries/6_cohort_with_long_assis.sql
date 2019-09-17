SELECT coh.name, AVG(completed_at-started_at) AS average_assistance_request_duration
FROM students stu
JOIN cohorts coh ON coh.id = stu.cohort_id
JOIN assistance_requests req ON req.student_id = stu.id
GROUP BY coh.name
ORDER BY average_assistance_request_duration DESC
LIMIT 1;
