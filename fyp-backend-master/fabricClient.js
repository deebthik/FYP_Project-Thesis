'use strict';

// Bring key classes into scope, most importantly Fabric SDK network class
const fs = require('fs');
const yaml = require('js-yaml');
const createClient = require('./createClient.js')
const { FileSystemWallet, Gateway } = require('fabric-network');

const wallet = new FileSystemWallet('./wallet');

module.exports = {
    /** 
     * Function to create a batch that starts off the supply chain.
     * @param {string} cultivationData the batch data to be stored on creation
     * @returns {string} a string representing a unique batchID to identify the created batch
     */
    createBatch: async (cultivationData) => {
        await createClient();
        const gateway = new Gateway();

        try {
            const userName = 'Admin@farminspector.supplychain.com'
            let connectionProfile = yaml.safeLoad(fs.readFileSync('./config.yaml', 'utf8'));
            let connectionOptions = {
                identity: userName,
                clientTlsIdentity: userName,
                wallet: wallet,
                discovery: { enabled: true, asLocalhost: true }
            };

            console.log('Connecting to Fabric gateway.');
            await gateway.connect(connectionProfile, connectionOptions);

            console.log('Use network channel: scchannel.');
            const network = await gateway.getNetwork('scchannel');

            // Get addressability to commercial paper contract
            console.log('Use supplycc smart contract.');
            const contract = await network.getContract('supplycc');

            console.log('Submit createBatch transaction.');
            const queryResponse = await contract.submitTransaction('createBatch', cultivationData);
            return JSON.parse(queryResponse.toString());

        } catch (error) {
            console.log(`Error processing transaction. ${error}`);
            console.log(error.stack);
        } finally {
            console.log('Disconnect from Fabric gateway.');
            gateway.disconnect();
        }
    },

    /** 
     * Function to update details for existing batch of the supply chain
     * @param {string} batchID the id of the batch to be updated
     * @param {string} nextStage the stage that is being updated
     * @param {string} nextStageData the data relating to the stage that is being updated
     */
    updateBatch: async (batchID, nextStage, nextStageData) => {
        await createClient();
        const gateway = new Gateway();

        try {
            const userName = 'Admin@farminspector.supplychain.com'
            let connectionProfile = yaml.safeLoad(fs.readFileSync('./config.yaml', 'utf8'));
            let connectionOptions = {
                identity: userName,
                clientTlsIdentity: userName,
                wallet: wallet,
                discovery: { enabled: true, asLocalhost: true }
            };

            console.log('Connecting to Fabric gateway.');
            await gateway.connect(connectionProfile, connectionOptions);

            console.log('Use network channel: scchannel.');
            const network = await gateway.getNetwork('scchannel');

            // Get addressability to commercial paper contract
            console.log('Use supplycc smart contract.');
            const contract = await network.getContract('supplycc');

            console.log('Submit updateBatch transaction.');
            const queryResponse = await contract.submitTransaction('updateBatch', batchID, nextStage, nextStageData);
            return JSON.parse(queryResponse.toString());
        } catch (error) {
            console.log(`Error processing transaction. ${error}`);
            console.log(error.stack);
        } finally {
            console.log('Disconnect from Fabric gateway.');
            gateway.disconnect();
        }
    },

    /** 
     * function the fetch details of one batch
     * @param {string} batchID the id of the batch to be queried
     * @returns A json object with data from all stages for the particular batch
     */
    queryBatch: async (batchID) => {
        await createClient();
        const gateway = new Gateway();

        try {
            const userName = 'Admin@farminspector.supplychain.com'
            let connectionProfile = yaml.safeLoad(fs.readFileSync('./config.yaml', 'utf8'));
            let connectionOptions = {
                identity: userName,
                clientTlsIdentity: userName,
                wallet: wallet,
                discovery: { enabled: true, asLocalhost: true }
            };

            console.log('Connecting to Fabric gateway.');
            await gateway.connect(connectionProfile, connectionOptions);

            console.log('Use network channel: scchannel.');
            const network = await gateway.getNetwork('scchannel');

            // Get addressability to commercial paper contract
            console.log('Use supplycc smart contract.');
            const contract = await network.getContract('supplycc');

            console.log('Evaluate QueryBatch transaction.');
            const queryResponse = await contract.evaluateTransaction('queryBatch', batchID);
            return JSON.parse(queryResponse.toString())

        } catch (error) {
            console.log(`Error processing transaction. ${error}`);
            console.log(error.stack);
        } finally {
            console.log('Disconnect from Fabric gateway.');
            gateway.disconnect();
        }
    },

    /**
     * Function to query list of all existing batches
     * @returns A json array with the list of all batches
     */
    queryBatchList: async () => {
        await createClient();
        const gateway = new Gateway();

        try {
            const userName = 'Admin@farminspector.supplychain.com'
            let connectionProfile = yaml.safeLoad(fs.readFileSync('./config.yaml', 'utf8'));
            let connectionOptions = {
                identity: userName,
                clientTlsIdentity: userName,
                wallet: wallet,
                discovery: { enabled: true, asLocalhost: true }
            };

            console.log('Connecting to Fabric gateway.');
            await gateway.connect(connectionProfile, connectionOptions);

            console.log('Use network channel: scchannel.');
            const network = await gateway.getNetwork('scchannel');

            // Get addressability to commercial paper contract
            console.log('Use supplycc smart contract.');
            const contract = await network.getContract('supplycc');

            console.log('Evaluate QueryBatchList transaction.');
            const queryResponse = await contract.evaluateTransaction('queryBatchList');
            return JSON.parse(queryResponse.toString());

        } catch (error) {
            console.log(`Error processing transaction. ${error}`);
            console.log(error.stack);
        } finally {
            console.log('Disconnect from Fabric gateway.');
            gateway.disconnect();
        }
    },

    /**
     * Function to create a batch using hardcoded data
     */
    testCreate: async () => {
        await createClient();
        const gateway = new Gateway();

        try {
            const userName = 'Admin@farminspector.supplychain.com'
            let connectionProfile = yaml.safeLoad(fs.readFileSync('./config.yaml', 'utf8'));
            let connectionOptions = {
                identity: userName,
                clientTlsIdentity: userName,
                wallet: wallet,
                discovery: { enabled: true, asLocalhost: true }
            };

            console.log('Connecting to Fabric gateway.');
            await gateway.connect(connectionProfile, connectionOptions);

            console.log('Use network channel: scchannel.');
            const network = await gateway.getNetwork('scchannel');

            // Get addressability to commercial paper contract
            console.log('Use supplycc smart contract.');
            const contract = await network.getContract('supplycc');

            console.log('submit testCreate transaction.');
            const queryResponse = await contract.submitTransaction('testCreate');
            return JSON.parse(queryResponse.toString());

        } catch (error) {
            console.log(`Error processing transaction. ${error}`);
            console.log(error.stack);
        } finally {
            console.log('Disconnect from Fabric gateway.');
            gateway.disconnect();
        }
    },

    /**
     * Function to update a batch using hardcoded data
     * @param {string} batchID the id of the batch to be updated
     */
    testUpdate: async (batchID) => {
        await createClient();
        const gateway = new Gateway();

        try {
            const userName = 'Admin@farminspector.supplychain.com'
            let connectionProfile = yaml.safeLoad(fs.readFileSync('./config.yaml', 'utf8'));
            let connectionOptions = {
                identity: userName,
                clientTlsIdentity: userName,
                wallet: wallet,
                discovery: { enabled: true, asLocalhost: true }
            };

            console.log('Connecting to Fabric gateway.');
            await gateway.connect(connectionProfile, connectionOptions);

            console.log('Use network channel: scchannel.');
            const network = await gateway.getNetwork('scchannel');

            // Get addressability to commercial paper contract
            console.log('Use supplycc smart contract.');
            const contract = await network.getContract('supplycc');

            console.log('Submit testUpdate transaction.');
            const queryResponse = await contract.submitTransaction('testUpdate', batchID);
            return JSON.parse(queryResponse.toString());

        } catch (error) {
            console.log(`Error processing transaction. ${error}`);
            console.log(error.stack);
        } finally {
            console.log('Disconnect from Fabric gateway.');
            gateway.disconnect();
        }
    }
}