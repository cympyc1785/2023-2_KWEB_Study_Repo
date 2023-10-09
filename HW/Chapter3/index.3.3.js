const express = require('express');
const app = express();
const port = 3000;

// Function
const factorial = (n) => {
    let result = 1;

    for (let i = 2; i <= n; i++){
        result *= i;
    }

    return result;
}


// Query Process
app.get('/factorial', (req, res) => {
    const { number } = req.query;
    return res.redirect('factorial/' + number);
});

app.get('/factorial/:number', (req, res) => {
    return res.send('Factorial of ' + req.params.number + ' : ' + factorial(req.params.number));
});


// Listen
app.listen(port, () => console.log(`Server listening on port ${port}!`));