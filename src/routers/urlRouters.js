import express from "express";
import { createShort, deleteShort, getShortById, openShortUrl } from "../controllers/urlControllers.js";
import { tokenMiddleware } from "../middlewares/tokenMiddleware.js";
import { createShortMiddleware, deleteShortMiddleware } from "../middlewares/urlMiddlewares.js";

const router = express.Router()

router.post('/urls/shorten', tokenMiddleware, createShortMiddleware, createShort)
router.get('/urls/:id', getShortById)
router.get('/urls/open/:shortUrl', openShortUrl)
router.delete('/urls/:id', tokenMiddleware, deleteShortMiddleware, deleteShort)

export default router;