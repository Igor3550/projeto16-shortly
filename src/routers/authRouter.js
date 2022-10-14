import express from 'express'
import { signIn, signUp } from '../controllers/authControllers.js'
import { signInMiddleware, signUpMiddleware } from '../middlewares/authMiddleware.js'

const router = express.Router()

router.post('/signup', signUpMiddleware, signUp);

export default router;
