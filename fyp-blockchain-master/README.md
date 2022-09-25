# Get Started

- Install prerequisites as mentioned in the [hyperledger docs](https://hyperledger-fabric.readthedocs.io/en/release-1.4/prereqs.html)
- Remove all existing docker images, containers, or volumes to make sure there are no conflicting images. Use the ```-f``` tag if any of the following commands fail.
```bash
docker rm $(docker ps -aq)
docker rmi $(docker images -aq)
docker volumes rm $(docker volume ls)
```
- Execute the following command to download samples, binaries, and docker images.
```bash
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 1.4.7 1.4.7 0.4.20
```
- Get the right version of go modules for writing chainode using the following commands. Create new folders where needed
```bash
cd $GOPATH/src/github.com/hyperledger
git clone --single-branch --branch release-1.4 https://github.com/hyperledger/fabric.git fabric
```

# Work with the blockhain
- To generate crypto certs and channel artifacts execute the generate script in the terminal. 
```bash
./generate.sh
```

- Once the relevant files have been generated bring up the network using docker compose 
```bash
docker-compose up
```

- With the network up and running, open  a new terminal window and execute the cli-script
```bash
./cli-script.sh
```

- Copy all Go dependencies using the mod vendor
```bash
cd chaincode/supplycc
go get github.com/hyperledger/fabric/core/chaincode/shim@v1.4
go get github.com/hyperledger/fabric/protos/peer@v1.4
go mod init chaincode
go mod tidy
go mod vendor
```

- To install and instantiate chaincode, execute the ccsetup script
```bash
./ccsetup.sh
```

- Use the ccupdate script to update chaincode. Replace 1 with the appropriate version number
```bash
./ccupdate.sh 1
```

- Test the chaincode using the following commands. A test id of is mentioned here. Replace it with the appropriate batchId value
```bash
# Create a batch
docker exec cli peer chaincode invoke -C scchannel -n supplycc -c '{"Args":["testCreate","{}"]}' -o orderer1.supplychain.com:7050 --tls --cafile=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/supplychain.com/msp/tlscacerts/tlsca.supplychain.com-cert.pem

# Update a batch (Only works to add Farm Inspector stage)
docker exec cli peer chaincode invoke -C scchannel -n supplycc -c '{"Args":["testUpdate","1duMYv63c3bjYFqPp47eYqeHZqE"]}' -o orderer1.supplychain.com:7050 --tls --cafile=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/supplychain.com/msp/tlscacerts/tlsca.supplychain.com-cert.pem

# Query history of single batch
docker exec cli peer chaincode query -C scchannel -n supplycc -c '{"Args":["queryBatch","1duMYv63c3bjYFqPp47eYqeHZqE"]}' -o orderer1.supplychain.com:7050 --tls --cafile=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/supplychain.com/msp/tlscacerts/tlsca.supplychain.com-cert.pem

#Query list of all batches
docker exec cli peer chaincode query -C scchannel -n supplycc -c '{"Args":["queryBatchList","{}"]}' -o orderer1.supplychain.com:7050 --tls --cafile=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/supplychain.com/msp/tlscacerts/tlsca.supplychain.com-cert.pem
```

# Utilities
- When the network is up, CouchDB UI is available on http://localhost:5984/_utils/

- To view metrics monitered by Prometheus (on http://localhost:9090/) open a new terminal dialog when the network is up and run the following command. Keep in mind to use the absolute path to the ```prometheus.yml``` file. The link will not have any results if visited before bringing up the prometheus container.
```bash
docker run -d --name prometheus-server \
-p 9090:9090
--restart always
-v /absolute/path/to/prometheus.yml:/etc/prometheus/prometheus.yml \
--network network_supplychain.com \
prom/prometheus
``` 

# Network Design Details

<u>Channel</u> : scchannel

<u>Orderer Channel</u> : syschannel

<u>Domain</u> : *.supplychain.com

1. Farm-Inspector
2. Harvester
3. Exporter
4. Importer
5. Processor

<u>Admin</u> : Admin creates new batch which is initial stage of coffee batch.

<u>Farm-Inspector</u> : Farm-inspectors are responsible for inspecting coffee farms and updating the information like coffee family, type of seed and fertilizers used for growing coffee.

<u>Harvester</u> : Harvesters conducting plucking, hulling , polishing , grading and sorting activities, further updating the information of crop variety, temperature used and humidity maintained during the process.

<u>Exporter</u> : Exporters are the organization who exports coffee beans throughout the world. Exporter adds quantity, destination address, ship name, ship number , estimated date and time and exporter id.

<u>Importer</u> : Importers imports the coffee from coffee suppliers and updates quantity, ship name, ship number , transporters information, warehouse name, warehouse address and the importer's address.

<u>Processor</u> : Processors are the organizations who processes raw coffee beans by roasting them on particular temperature and humidity and makes it ready for packaging and to sale into markets. Processor adds the information like quantity, temperature , roasting duration , internal batch number , packaging date time, processor name and processor address.