CONFIG_ROOT=/opt/gopath/src/github.com/hyperledger/fabric/peer
ORDERER_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/ordererOrganizations/supplychain.com/orderers/orderer.supplychain.com/msp/tlscacerts/tlsca.supplychain.com-cert.pem

#FarmInspector Environment Variables
FARMINSPECTOR_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/farminspector.supplychain.com/users/Admin@farminspector.supplychain.com/msp
FARMINSPECTOR_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/farminspector.supplychain.com/peers/peer0.farminspector.supplychain.com/tls/ca.crt

#Harvester Environment Variables
HARVESTER_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/harvester.supplychain.com/users/Admin@harvester.supplychain.com/msp
HARVESTER_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/harvester.supplychain.com/peers/peer0.harvester.supplychain.com/tls/ca.crt

#Exporter Environment Variables
EXPORTER_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/exporter.supplychain.com/users/Admin@exporter.supplychain.com/msp
EXPORTER_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/exporter.supplychain.com/peers/peer0.exporter.supplychain.com/tls/ca.crt

#Importer Environment Variables
IMPORTER_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/importer.supplychain.com/users/Admin@importer.supplychain.com/msp
IMPORTER_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/importer.supplychain.com/peers/peer0.importer.supplychain.com/tls/ca.crt

#Processor Environment Variables
PROCESSOR_MSPCONFIGPATH=${CONFIG_ROOT}/crypto/peerOrganizations/processor.supplychain.com/users/Admin@processor.supplychain.com/msp
PROCESSOR_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/peerOrganizations/processor.supplychain.com/peers/peer0.processor.supplychain.com/tls/ca.crt

CAFILE_PATH=${CONFIG_ROOT}/crypto/ordererOrganizations/supplychain.com/msp/tlscacerts/tlsca.supplychain.com-cert.pem

echo
echo "Creating channel" 
docker exec cli \
  peer channel create \
  -c scchannel \
  -f ./channel-artifacts/channel.tx -o orderer1.supplychain.com:7050 \
  --tls --cafile=${CAFILE_PATH}

##############################
## Farm Inspector Joins Chanel
##############################
echo
echo "\npeer0 of FarmInspector joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=FarmInspectorMSP \
  -e CORE_PEER_ADDRESS=peer0.farminspector.supplychain.com:7051 \
  -e CORE_PEER_MSPCONFIGPATH=${FARMINSPECTOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${FARMINSPECTOR_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

echo 
echo "\npeer1 of FarmInspector joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=FarmInspectorMSP \
  -e CORE_PEER_ADDRESS=peer1.farminspector.supplychain.com:8051 \
  -e CORE_PEER_MSPCONFIGPATH=${FARMINSPECTOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${FARMINSPECTOR_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

##########################
## Harvester joins channel
##########################
echo
echo "peer0 of Harvester joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=HarvesterMSP \
  -e CORE_PEER_ADDRESS=peer0.harvester.supplychain.com:9051 \
  -e CORE_PEER_MSPCONFIGPATH=${HARVESTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${HARVESTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

echo
echo "peer1 of Harvester joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=HarvesterMSP \
  -e CORE_PEER_ADDRESS=peer1.harvester.supplychain.com:10051 \
  -e CORE_PEER_MSPCONFIGPATH=${HARVESTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${HARVESTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

# #########################
# ## Exporter joins channel 
# #########################
echo
echo "peer0 of Exporter joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ExporterMSP \
  -e CORE_PEER_ADDRESS=peer0.exporter.supplychain.com:11051 \
  -e CORE_PEER_MSPCONFIGPATH=${EXPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${EXPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

echo
echo "peer1 of Exporter joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ExporterMSP \
  -e CORE_PEER_ADDRESS=peer1.exporter.supplychain.com:12051 \
  -e CORE_PEER_MSPCONFIGPATH=${EXPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${EXPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

# #########################
# ## Importer joins channel
# #########################
echo
echo "peer0 of Importer joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ImporterMSP \
  -e CORE_PEER_ADDRESS=peer0.importer.supplychain.com:13051 \
  -e CORE_PEER_MSPCONFIGPATH=${IMPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${IMPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

echo
echo "peer1 of Importer joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ImporterMSP \
  -e CORE_PEER_ADDRESS=peer1.importer.supplychain.com:14051 \
  -e CORE_PEER_MSPCONFIGPATH=${IMPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${IMPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

# #########################
# ## Processor joins channel
# #########################
echo
echo "peer0 of Processor joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ProcessorMSP \
  -e CORE_PEER_ADDRESS=peer0.processor.supplychain.com:15051 \
  -e CORE_PEER_MSPCONFIGPATH=${PROCESSOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${PROCESSOR_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

echo
echo "peer1 of Processor joining channel"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ProcessorMSP \
  -e CORE_PEER_ADDRESS=peer1.processor.supplychain.com:16051 \
  -e CORE_PEER_MSPCONFIGPATH=${PROCESSOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${PROCESSOR_TLS_ROOTCERT_FILE} \
  cli \
  peer channel join \
    -b scchannel.block
set +x

sleep 5
#########################
## Assigning Anchor peers
#########################
echo
echo "Assigning FarmInspector Anchor peer"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=FarmInspectorMSP \
  -e CORE_PEER_ADDRESS=peer0.farminspector.supplychain.com:7051 \
  -e CORE_PEER_MSPCONFIGPATH=${FARMINSPECTOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${FARMINSPECTOR_TLS_ROOTCERT_FILE} \
  cli \
    peer channel update \
    -o orderer1.supplychain.com:7050 --tls --cafile=${CAFILE_PATH} \
    -c scchannel \
    -f ./channel-artifacts/FarmInspectorMSPanchors.tx
set +x

echo
echo "Assigning Harvester Anchor peer"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=HarvesterMSP \
  -e CORE_PEER_ADDRESS=peer0.harvester.supplychain.com:9051 \
  -e CORE_PEER_MSPCONFIGPATH=${HARVESTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${HARVESTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel update \
    -o orderer1.supplychain.com:7050 --tls --cafile=${CAFILE_PATH} \
    -c scchannel \
    -f ./channel-artifacts/HarvesterMSPanchors.tx
set +x

echo
echo "Assigning Exporter Anchor peer"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ExporterMSP \
  -e CORE_PEER_ADDRESS=peer0.exporter.supplychain.com:11051 \
  -e CORE_PEER_MSPCONFIGPATH=${EXPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${EXPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel update \
    -o orderer1.supplychain.com:7050 --tls --cafile=${CAFILE_PATH} \
    -c scchannel \
    -f ./channel-artifacts/ExporterMSPanchors.tx
set +x

echo
echo "Assigning Importer Anchor peer"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ImporterMSP \
  -e CORE_PEER_ADDRESS=peer0.importer.supplychain.com:13051 \
  -e CORE_PEER_MSPCONFIGPATH=${IMPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${IMPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer channel update \
    -o orderer1.supplychain.com:7050 --tls --cafile=${CAFILE_PATH} \
    -c scchannel \
    -f ./channel-artifacts/ImporterMSPanchors.tx
set +x

echo
echo "Assigning Processor Anchor peer"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ProcessorMSP \
  -e CORE_PEER_ADDRESS=peer0.processor.supplychain.com:15051 \
  -e CORE_PEER_MSPCONFIGPATH=${PROCESSOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${PROCESSOR_TLS_ROOTCERT_FILE} \
  cli \
  peer channel update \
    -o orderer1.supplychain.com:7050 --tls --cafile=${CAFILE_PATH} \
    -c scchannel \
    -f ./channel-artifacts/ProcessorMSPanchors.tx
set +x
