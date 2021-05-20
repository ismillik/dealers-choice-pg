const pg = require('pg');
const postgresUrl = 'postgres://localhost/composers'
const client = new pg.Client(postgresUrl);

client.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log('connected');
    };
});

module.exports = client;