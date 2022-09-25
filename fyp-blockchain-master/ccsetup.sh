CONFIG_ROOT=/opt/gopath/src/github.com/hyperledger/fabric/peer
ORDERER_TLS_ROOTCERT_FILE=${CONFIG_ROOT}/crypto/ordererOrganizations/supplychain.com/orderers/orderer1.supplychain.com/msp/tlscacerts/tlsca.supplychain.com-cert.pem

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

CC_VERSION_NO=0
###############################
## Farm Inspector installs chaincode
##############################
echo
echo "\npeer0 of FarmInspector installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=FarmInspectorMSP \
  -e CORE_PEER_ADDRESS=peer0.farminspector.supplychain.com:7051 \
  -e CORE_PEER_MSPCONFIGPATH=${FARMINSPECTOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${FARMINSPECTOR_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

echo 
echo "\npeer1 of FarmInspector installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=FarmInspectorMSP \
  -e CORE_PEER_ADDRESS=peer1.farminspector.supplychain.com:8051 \
  -e CORE_PEER_MSPCONFIGPATH=${FARMINSPECTOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${FARMINSPECTOR_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

##########################
## Harvester installs chaincode
##########################
echo
echo "peer0 of Harvester installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=HarvesterMSP \
  -e CORE_PEER_ADDRESS=peer0.harvester.supplychain.com:9051 \
  -e CORE_PEER_MSPCONFIGPATH=${HARVESTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${HARVESTER_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

echo
echo "peer1 of Harvester installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=HarvesterMSP \
  -e CORE_PEER_ADDRESS=peer1.harvester.supplychain.com:10051 \
  -e CORE_PEER_MSPCONFIGPATH=${HARVESTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${HARVESTER_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

# #########################
# ## Exporter installs chaincode 
# #########################
echo
echo "peer0 of Exporter installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ExporterMSP \
  -e CORE_PEER_ADDRESS=peer0.exporter.supplychain.com:11051 \
  -e CORE_PEER_MSPCONFIGPATH=${EXPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${EXPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

echo
echo "peer1 of Exporter installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ExporterMSP \
  -e CORE_PEER_ADDRESS=peer1.exporter.supplychain.com:12051 \
  -e CORE_PEER_MSPCONFIGPATH=${EXPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${EXPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

# #########################
# ## Importer installs chaincode
# #########################
echo
echo "peer0 of Importer installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ImporterMSP \
  -e CORE_PEER_ADDRESS=peer0.importer.supplychain.com:13051 \
  -e CORE_PEER_MSPCONFIGPATH=${IMPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${IMPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

echo
echo "peer1 of Importer installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ImporterMSP \
  -e CORE_PEER_ADDRESS=peer1.importer.supplychain.com:14051 \
  -e CORE_PEER_MSPCONFIGPATH=${IMPORTER_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${IMPORTER_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

# #########################
# ## Processor installs chaincode
# #########################
echo
echo "peer0 of Processor installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ProcessorMSP \
  -e CORE_PEER_ADDRESS=peer0.processor.supplychain.com:15051 \
  -e CORE_PEER_MSPCONFIGPATH=${PROCESSOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${PROCESSOR_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

echo
echo "peer1 of Processor installing chaincode"
set -x
docker exec \
  -e CORE_PEER_LOCALMSPID=ProcessorMSP \
  -e CORE_PEER_ADDRESS=peer1.processor.supplychain.com:16051 \
  -e CORE_PEER_MSPCONFIGPATH=${PROCESSOR_MSPCONFIGPATH} \
  -e CORE_PEER_TLS_ROOTCERT_FILE=${PROCESSOR_TLS_ROOTCERT_FILE} \
  cli \
  peer chaincode install \
    -p supplycc \
    -n supplycc \
    -v ${CC_VERSION_NO}
set +x

#########################
# Instantiating chaincode
#########################
echo
echo "instantiating chaincode"
set -x
docker exec \
cli peer chaincode instantiate \
    -C scchannel \
    -n supplycc \
    -v ${CC_VERSION_NO} \
    -c '{"Args":[]}' \
    -o orderer1.supplychain.com:7050 --tls --cafile=${CAFILE_PATH}
set +x

