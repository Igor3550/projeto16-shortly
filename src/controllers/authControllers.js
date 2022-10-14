import db from '../database.js';
import { nanoid } from 'nanoid';
import bcrypt from 'bcrypt';

async function signUp (req, res) {
  const body = res.locals.body;
  try {
    const passwordHash = bcrypt.hashSync(body.password, 10);
    await db.query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3)', [body.name, body.email, passwordHash])
    return res.sendStatus(201);
  } catch (error) {
    console.log(error)
    return res.sendStatus(500);
  }
}

async function signIn (req, res) {
  console.log('signin')
}

export {
  signUp,
  signIn
}