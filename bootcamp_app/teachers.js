
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// console.log(process.argv[2]);
values = [`${process.argv[2]}`]
const queryString = `
SELECT DISTINCT(teachers.name) AS teacher_name, cohorts.name AS cohort_name
FROM assistance_requests req
JOIN teachers ON teachers.id = req.teacher_id
JOIN students ON students.id = req.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1;
`;
pool.query(queryString,values)
.then(res => {
  res.rows.forEach(res => {
    console.log(`${res.cohort_name}: ${res.teacher_name}`);
  })
  pool.end();
})
.catch(err => console.error('query error', err.stack))

