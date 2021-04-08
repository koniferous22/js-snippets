import express from 'express';

const app = express()

app.get('/hello', (req, res, next) => {
  res.status(200).send({
    message: 'world'
  });
})

const PORT = 3000;

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
