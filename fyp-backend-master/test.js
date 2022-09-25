const fabricClient = require('./fabricClient');

fabricClient.testCreate().then((res) => {
    console.log(res);
});