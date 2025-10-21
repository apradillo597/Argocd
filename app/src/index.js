import express from 'express';
const app = express();
const port = process.env.PORT || 3000;


app.get('/', (req, res) => {
res.json({ status: 'ok', time: new Date().toISOString(), version: process.env.APP_VERSION || 'dev' });
});


app.listen(port, () => console.log(`hello-api escuchando en :${port}`));