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
  const body = req.body
  const user = res.locals.user
  try {
    if(!bcrypt.compareSync(body.password, user.password)) return res.status(401).send("Usuário e/ou senha invalido(s)!");
    
    const token = nanoid()
    await db.query('INSERT INTO sections (user_id, token) VALUES ($1, $2);', [user.id, token])
    
    return res.send({token: token})
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  signUp,
  signIn
}