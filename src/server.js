import express from 'express';
import cors from 'cors';
import authRouters from './routers/authRouter.js'
import urlRouters from './routers/urlRouters.js'

const PORT = process.env.PORT || 4000
const app = express()
app.use(express.json())
app.use(cors())

app.use(authRouters)
app.use(urlRouters)

app.listen(PORT, () => console.log(`Listen on port: ${PORT}`))