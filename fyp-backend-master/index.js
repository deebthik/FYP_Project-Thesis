const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const fabricClient = require('./fabricClient.js');
const utils = require('./utils.js');
const app = express();

app.use(morgan('tiny'));
app.use(cors());
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.json({
        message: 'Behold The CFEVN Stack!'
    });
});

app.get('/queryResponse', (req, res) => {
    fabricClient.queryBatchList().then(response => utils.processBatchList(response)).then((response) => {
        res.json(response);
    });
});

app.post('/queryBatch', (req, res) => {
    fabricClient.queryBatch(req.body.id).then((response) => {
        res.json(response)
    }).catch((error) => {
        res.status(500);
        res.json(error);
    });
});

app.post('/createBatch', (req, res) => {
    let str = JSON.stringify(req.body);
    fabricClient.createBatch(str).then((response) => {
        res.json(response);
    }).catch((error) => {
        res.status(500);
        res.json(error);
    });
});

app.post('/updateBatch', (req, res) => {
    let data = JSON.stringify(req.body.data);
    fabricClient.updateBatch(req.body.id, req.body.stage, data).then((response) => {
        res.json(response);
    }).catch((error) => {
        res.status(500);
        res.json(error);
    });
})

const port = process.env.PORT || 4000;
app.listen(port, () => {
    console.log(`listening on ${port}`);
});