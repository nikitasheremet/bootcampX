SELECT teachers.name, stu.name, assignments.name, (req.completed_at - req.started_at) AS duration
FROM assistance_requests req
JOIN teachers ON teachers.id = req.teacher_id
JOIN students stu ON stu.id = req.student_id
JOIN assignments ON assignments.id = req.assignment_id
ORDER BY duration;