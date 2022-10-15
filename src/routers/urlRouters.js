import express from "express";
import { createShort, getShortById } from "../controllers/urlControllers.js";
import { tokenMiddleware } from "../middlewares/tokenMiddleware.js";
import { createShortMiddleware } from "../middlewares/urlMiddlewares.js";

const router = express.Router()

router.post('/urls/shorten', tokenMiddleware, createShortMiddleware, createShort)
router.get('/urls/:id', getShortById)

export default router;