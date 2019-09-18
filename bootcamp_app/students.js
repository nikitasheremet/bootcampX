const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
values = [`%${process.argv[2]}%`, process.argv[3]];
pool.query(`
SELECT students.id, students.name, cohorts.name, cohort_id
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`,values)
.then(res => {
  res.rows.forEach(res => {
    console.log(`${res.name} has an id of ${res.id} and was in the ${res.name} cohort`);
  })
  pool.end();
})
.catch(err => console.error('query error', err.stack));