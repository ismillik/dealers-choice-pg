const express = require('express');
const morgan = require('morgan');
const client = require('./db');


const app = express();

app.use(morgan('dev'));


//Main Page
app.get('/', (req, res, next) => {
    const html = `<!DOCTYPE html>
    <html>
        <head>
            <title>An Inexhaustive List of Film Composers</title>
            <!-- <link rel="stylesheet" href="/style.css" /> -->
        </head>
        <body>
            <h1>An Inexhaustive List of Film Composers</h1>
            <ul>
                <li><a href='/composer/1'>Hans Zimmer</a></li>
                <li><a href='/composer/2'>Philip Glass</a></li>
                <li><a href='/composer/3'>Johan Johannson</a></li>
                <li><a href='/composer/4'>Jonny Greenwood</a></li>
                <li><a href='/composer/5'>Alexandre Desplat</a></li>
                <li><a href='/composer/6'>John Williams</a></li>
            </ul>
        </body>
    </html>`;
    res.send(html);
});

//Individual composer page
app.get('/composer/:id', async (req, res, next) => {
    
    try {
        const composerId = req.params.id;
        const data = await client.query('SELECT composers.id, composers.name, films.title FROM composers JOIN films ON composers.id=composerid WHERE composerId=$1',[composerId]);
        const films = data.rows;
        
        const html = `<!DOCTYPE html>
        <html>
            <head>
                <title>individual page</title>
                <!-- <link rel="stylesheet" href="/style.css" /> -->
            </head>
            <body>
                <h2><a href='/'>${films[0].name}</a></h2>
                <p>Film scores:</p>
                <ul>
                    ${films.map((film) => `<li>${film.title}</li>`).join('')}
                </ul>
            </body>
        </html>`
        res.send(html);
    } catch (err) {
        next(err);
    };
});


const PORT = 3000;

app.listen(PORT, () => {
    console.log(`App listening in port ${PORT}`);
});
