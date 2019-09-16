SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignemnt_submission
FROM students JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE end_date IS NULL
GROUP BY student
ORDER BY average_assignemnt_submission DESC;