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

export {
  createShortMiddleware
}