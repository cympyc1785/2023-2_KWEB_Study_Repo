const express = require('express');
const router = require('./router');
const port = 3000;

const app = express();

app.use('/', router); // '/'는 해당 directory에 router binding

app.listen(port, () => console.log(`Server listening on port ${port}!`));