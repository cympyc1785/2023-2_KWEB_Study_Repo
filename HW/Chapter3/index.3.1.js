const express = require('express');
const app = express();
const port = 3000;

// Bind
app.use(express.urlencoded({ extended: true }));


// Function
const objectToString = (obj) => {
    return Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');
}


// Query Process
app.get('/', (req, res) => {
    return res.send(objectToString(req.query));
});

app.post('/', (req, res) => {
    return res.send(objectToString(req.body));
});

app.put('/', (req, res) => {
    return res.send(objectToString(req.body));
});

app.delete('/', (req, res) => {
    return res.send(objectToString(req.body));
});


// Listen
app.listen(port, () => console.log(`Server listening on port ${port}!`));