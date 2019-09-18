const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT(teachers.name) AS teacher_name, cohorts.name AS cohort_name
FROM assistance_requests req
JOIN teachers ON teachers.id = req.teacher_id
JOIN students ON students.id = req.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = '${process.argv[2]}';
`)
.then(res => {
  res.rows.forEach(res => {
    console.log(`${res.cohort_name}: ${res.teacher_name}`);
  })
})
.catch(err => console.error('query error', err.stack));