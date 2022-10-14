import db from '../database.js';
import { nanoid } from 'nanoid';

async function createShort (req, res) {
  const { url } = req.body
  const user = res.locals.user

  try {
    const short = nanoid(8)
    await db.query('INSERT INTO shorts (original_url, short_url, user_id) VALUES ($1, $2, $3);', [url, short, user.id])
    return res.send({shortUrl: short})
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  createShort
}