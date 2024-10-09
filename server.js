require('dotenv').config();
const express = require('express');

const app = express();
const PORT = 3003;

app.get('/', (req, res) => {
    res.send("Olá, Mawe ")
})


app.listen(PORT,()=>{
    console.log(`\x1b[32m%s\x1b[0m`, `listening on port ${PORT}!`);
})