import db from '../database.js';

async function getRanking (req, res) {
  try {
    const userShortsVisit = await db.query(`
      SELECT 
        users.id,
        users.name,
        COUNT(short_visits.id) AS "visitCount"
      FROM users
      LEFT JOIN shorts ON shorts.user_id = users.id
      LEFT JOIN short_visits ON shorts.id = short_visits.short_id
      GROUP BY users.id ORDER BY "visitCount" DESC LIMIT 10;
    `)
    const userShortsCount = await db.query(`
      SELECT 
        users.id,
        users.name,
        COUNT(shorts.id) AS "linksCount"
      FROM users
      LEFT JOIN shorts ON shorts.user_id = users.id
      GROUP BY users.id ORDER BY "linksCount" DESC LIMIT 10;
    `)

    const list = userShortsVisit.rows.map((user) => {
      const linksList = userShortsCount.rows.filter(userLinks => userLinks.id === user.id)
      return {
        ...user,
        linksCount: linksList[0] ? linksList[0].linksCount : '0'
      }
    })

    res.send(list)
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  getRanking
}