import joi from 'joi';
import db from '../database.js';

const signUpSchema = joi.object({
  name: joi.string().required(),
  email: joi.string().email().required(),
  password: joi.string().required(),
  confirmPassword: joi.string().required()
})

const signInSchema = joi.object({
  email: joi.string().email().required(),
  password: joi.string().required()
})

async function signUpMiddleware (req, res, next) {
  const body = req.body
  try {
    const validation = signUpSchema.validate(body)
    if(validation.error){
      const message = validation.error.details[0].message
      return res.status(422).send(message)
    }

    if(body.password !== body.confirmPassword) return res.status(422).send('Password and ConfirmPassword must be the same!')

    const userExist = await db.query('SELECT * FROM users WHERE email = $1;', [body.email])
    if(userExist.rows[0]) return res.status(409).send('Email already exists!')

    delete body.confirmPassword
    res.locals.body = body
    next()
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
}

async function signInMiddleware (req, res, next){
  const body = req.body
  try {
    const validation = signInSchema.validate(body);
    if(validation.error){
      const message = validation.error.details[0].message
      return res.status(422).send(message)
    }

    const emailExistent = await db.query('SELECT * FROM users WHERE email = $1;', [body.email])
    if(!emailExistent.rows[0]) return res.status(401).send('Usuário e/ou senha invalido(s)!')

    res.locals.user = emailExistent.rows[0]
    next()
  } catch (error) {
    console.log(error)
    return res.sendStatus(500)
  }
}

export {
  signUpMiddleware,
  signInMiddleware
}