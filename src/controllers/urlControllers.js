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

async function getShortById (req, res) {
  const shortId = req.params.id
  try {
    const resp = await db.query('SELECT * FROM shorts WHERE id = $1', [shortId])
    if(!resp.rows[0]) return res.sendStatus(404)

    const returnBody = {
      id: resp.rows[0].id,
      shortUrl: resp.rows[0].short_url,
      url: resp.rows[0].original_url
    }
    
    return res.send(returnBody)
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  createShort,
  getShortById
}