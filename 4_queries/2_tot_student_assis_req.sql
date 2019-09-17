SELECT COUNT(req.student_id), stu.name
FROM assistance_requests req
JOIN students stu ON stu.id = req.student_id
WHERE stu.name = 'Elliot Dickinson'
GROUP BY stu.name;