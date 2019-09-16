SELECT students.name, AVG(assignment_submissions.duration) AS average_assignment_submission, AVG(assignments.duration) AS average_estimated_duration
FROM assignment_submissions JOIN students ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY AVG(assignment_submissions.duration);
