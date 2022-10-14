import db from '../database.js';

async function tokenMiddleware (req, res, next) {
  const authorization = req.headers.authorization
  const token = authorization?.replace('Bearer ', '');

  if(!token) return res.sendStatus(401);

  try {
    const session = await db.query('SELECT * FROM sections WHERE token = $1;', [token])
    if(!session.rows[0]) return res.sendStatus(401);

    const user = await db.query('SELECT * FROM users WHERE id = $1;', [session.rows[0].user_id])
    if(!user.rows[0]) return res.sendStatus(401)
    delete user.password;
    
    res.locals.user = user.rows[0];
    next();
  } catch (error) {
    console.log(error)
    res.sendStatus(500);
  }
}
export {
  tokenMiddleware
}