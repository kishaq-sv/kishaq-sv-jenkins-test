const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World! Your Jenkins pipeline is fully automated and working!');
});

app.listen(PORT, () => {
  console.log(`Server is running securely on port ${PORT}`);
});
