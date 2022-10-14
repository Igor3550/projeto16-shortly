import pg from 'pg';
const { Pool } = pg;

const connectionConfig = {
  user : 'postgres',
  password : '1212',
  host : 'localhost',
  port : 5432,
  database : 'shortly'
}

const connection = new Pool(connectionConfig);
/*/
const connection = new Pool({
  connectionString: process.env.DATABASE_URL,
});
*/
export default connection;