import db from '../database.js';

async function getRanking (req, res) {
  try {
    const usersWithout = await db.query(`
      SELECT id, name FROM users WHERE users.id NOT IN (
        SELECT user_id FROM shorts
      );
    `)
    const userShortsVisit = await db.query(`
      SELECT 
        COUNT(short_visits.short_id) AS "visitCount",
        users.name,
        users.id
      FROM short_visits
      JOIN shorts ON shorts.id = short_visits.short_id
      JOIN users ON users.id = shorts.user_id
      GROUP BY users.id;
    `)
    const userShortsCount = await db.query(`
      SELECT 
        COUNT(shorts.id) AS "linksCount",
        users.id,
        users.name
      FROM shorts
      JOIN users ON users.id = shorts.user_id
      GROUP BY users.id LIMIT 10;
    `)

    const list = userShortsCount.rows.map((user) => {
      const visitCounts = userShortsVisit.rows.filter(userVisits => userVisits.id === user.id)
      return {
        ...user,
        visitCount: visitCounts[0] ? parseInt(visitCounts[0].visitCount) : 0
      }
    })
    list.sort((a, b) => {
      if(a.visitCount < b.visitCount) return 1
      if(a.visitCount > b.visitCount) return -1
      return 0
    })
    if(list.length < 10){
      for(let i = 0; i<usersWithout.rows.length; i++){
        if(list.length < 10){
          list.push({
            ...usersWithout.rows[i],
            linksCount: 0,
            visitCount: 0
          })
        }
      }
    }
    res.send(list)
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  getRanking
}