import express from 'express';
import { getUserInfo } from '../controllers/userControllers.js';
import { tokenMiddleware } from '../middlewares/tokenMiddleware.js'

const router = express.Router()

router.get('/users/me', tokenMiddleware, getUserInfo)

export default router;