const express = require('express');
const {runQuery} = require('./database');

const app = express();
const port = 3000;

app.get('/fare', async(req, res, next) => {
    try {
        const {uid} = req.query;
        const sql = 'SELECT sum(round(t.distance * types.fare_rate / 1000, -2)) AS total_fare ' +
        'FROM tickets ' +
        'INNER JOIN users ON tickets.user = users.id AND users.id = ? ' +
        'INNER JOIN trains AS t ON t.id = tickets.train ' +
        'INNER JOIN types ON t.type = types.id;'
        const {total_fare} = (await runQuery(sql, [uid]))[0];
        return res.send(`Total Fare : ${total_fare}`);
    }
    catch (err) {
        console.error(err);
        return res.sendStatus(500);
    }
})

app.get('/train/status', async(req, res, next) => {
    try {
        const {tid} = req.query;
        const sql = 'SELECT count(*) AS occupied, types.max_seats ' +
        'FROM tickets ' +
        'INNER JOIN trains AS t ON t.id = tickets.train AND t.id = ? ' +
        'INNER JOIN types ON t.type = types.id;'
        const {occupied, max_seats} = (await runQuery(sql, [tid]))[0];
        if (occupied < max_seats) return res.send(`Remaining Seats : ${max_seats - occupied} Out of : ${max_seats}`);
        else return res.send(`Sorry. No Remaining Seats.`);
    }
    catch (err) {
        console.error(err);
        return res.sendStatus(500);
    }
})

app.listen(port, () => console.log(`Server listening on port ${port}`));