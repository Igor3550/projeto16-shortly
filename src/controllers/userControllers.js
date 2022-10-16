import db from '../database.js';

async function getUserInfo (req, res) {
  const user = res.locals.user;
  try {
    const totalUserVisits = await db.query(`
      SELECT 
        COUNT(short_visits.short_id) AS "visitCount"
      FROM short_visits
      JOIN shorts ON shorts.id = short_visits.short_id
      WHERE shorts.user_id = $1;
    `, [user.id]);

    const userShorts = await db.query(`
      SELECT 
        COUNT(short_visits.short_id) AS "visitCount",
        shorts.id,
        shorts.original_url AS url,
        shorts.short_url AS shortUrl
      FROM short_visits
      JOIN shorts ON shorts.id = short_visits.short_id
      WHERE shorts.user_id = $1
      GROUP BY shorts.id;
    `, [user.id]);

    const body = {
      id: user.id,
      name: user.name,
      ...totalUserVisits.rows[0],
      shortenedUrls: userShorts.rows
    }

    return res.send(body)
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  getUserInfo
}