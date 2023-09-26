const { Router } = require('express');

const router = Router();

app.get('/', (req, res) => res.send(`
<h1>GET /</h1>
<h3>Hello World!</h3>
`));
router.post('/', (req, res) => res.send('POST /'));
router.get('/dir', (req, res) => res.send('GET /'));
router.post('/dir', (req, res) => res.send('POST /'));

module.exports = router;
