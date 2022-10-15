import db from '../database.js';

const httpRegex = /^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$/;

async function createShortMiddleware (req, res, next) {
  const body = req.body
  try {
    if(!httpRegex.test(body.url)) return res.status(422).send('URL must be a valid url!');
    next()
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

async function deleteShortMiddleware (req, res, next) {
  const shortId = req.params.id
  const user = res.locals.user
  try {
    const shortUserData = (await db.query('SELECT * FROM shorts WHERE user_id = $1 AND id = $2;', [user.id, shortId])).rows[0]
    if(!shortUserData) {
      const existShort = (await db.query('SELECT * FROM shorts WHERE id = $1;', [shortId])).rows[0]
      if(!existShort){
        return res.sendStatus(404)
      }else{
        return res.sendStatus(401)
      }
    }

    res.locals.shortInfo = shortUserData
    next()
    
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  createShortMiddleware,
  deleteShortMiddleware
}