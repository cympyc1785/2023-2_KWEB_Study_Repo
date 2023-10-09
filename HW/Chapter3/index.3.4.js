const express = require('express');
const app = express();
const port = 3000;

// Pug Set
app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');


// Middleware
app.use(express.urlencoded({ extended: true }));

// Query Process
app.get('/', (req, res) => {
    return res.render('login.pug');
});

app.post('/login', (req, res) => {
    let { username, password } = req.body
    return res.send('Username: ' + username + '\n' + 'Password: ' + password);
});


// Listen
app.listen(port, () => console.log(`Server listening on port ${port}!`));