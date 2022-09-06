const express = require('express')
const app = express()
const port = 3000

app.get('/',(req, resp) => {
    resp.send('<h1>DARP</h1>')
})

app.listen(port, () => {
    console.log('Rodando na porta ' + port)
})