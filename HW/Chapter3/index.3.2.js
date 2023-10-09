const express = require('express');
const app = express();
const port = 3000;

// Query Process
app.get('/board/page/:page', (req, res) => {
    return res.send('This is page #' + req.params.page);
});


// Listen
app.listen(port, () => console.log(`Server listening on port ${port}!`));