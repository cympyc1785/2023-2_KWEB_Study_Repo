SELECT sum(round(t.distance * types.fare_rate / 1000, -2)) AS total_fare
FROM tickets
INNER JOIN users ON tickets.user = users.id AND users.id = 1
INNER JOIN trains AS t ON t.id = tickets.train
INNER JOIN types ON t.type = types.id;


SELECT count(*) AS occupied, types.max_seats
FROM tickets
INNER JOIN trains AS t ON t.id = tickets.train AND t.id = 1
INNER JOIN types ON t.type = types.id;