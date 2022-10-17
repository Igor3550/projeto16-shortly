import pg from 'pg';
import dotenv from 'dotenv'
dotenv.config();

const { Pool } = pg;

const connectionConfig = {
  user : 'postgres',
  password : '1212',
  host : 'localhost',
  port : 5432,
  database : 'shortly'
}

//const connection = new Pool(process.env.DATABASE_URL || connectionConfig);
console.log(process.env.DATABASE_URL)
const connection = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl:{
    rejectUnauthorized: false
  }
});

export default connection;