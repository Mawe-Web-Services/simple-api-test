require('dotenv').config();
const express = require('express');
const crypto = require('crypto');

const app = express();
const PORT = 3003;

const createHash = (idCliente, timestamp, segredo) =>{
    const data = idCliente + timestamp + segredo;
    return crypto.createHash('sha256').update(data).digest('hex');
  }

app.get('/', (req, res) => {
    res.send("Olá, Mawe ")
})

app.get('/health', (req, res) => {
    const clientID = process.env.CLIENT_ID
    const secretKey = process.env.CLIENT_SECRET_KEY
    const timestamp = req.query.timestamp;

    const hash = createHash(clientID, timestamp, secretKey);

    res.json({
        hash: hash,
        timestamp: timestamp
      });
})

app.listen(PORT,()=>{
    console.log(`\x1b[32m%s\x1b[0m`, `listening on port ${PORT}!`);
})