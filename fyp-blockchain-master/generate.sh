export PATH=$PATH:$PWD/bin

echo
echo "Generating crypto materials"
set -x
cryptogen generate --config=./crypto-config.yaml
set +x

echo
echo "Generating channel-artifacts"
set -x
configtxgen -profile SupplyChainOrdererGenesis -channelID syschannel -outputBlock channel-artifacts/genesis.block
configtxgen -profile SupplyChainChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID scchannel
configtxgen -profile SupplyChainChannel -outputAnchorPeersUpdate ./channel-artifacts/FarmInspectorMSPanchors.tx -channelID scchannel -asOrg FarmInspectorMSP
configtxgen -profile SupplyChainChannel -outputAnchorPeersUpdate ./channel-artifacts/HarvesterMSPanchors.tx -channelID scchannel -asOrg HarvesterMSP
configtxgen -profile SupplyChainChannel -outputAnchorPeersUpdate ./channel-artifacts/ExporterMSPanchors.tx -channelID scchannel -asOrg ExporterMSP
configtxgen -profile SupplyChainChannel -outputAnchorPeersUpdate ./channel-artifacts/ImporterMSPanchors.tx -channelID scchannel -asOrg ImporterMSP
configtxgen -profile SupplyChainChannel -outputAnchorPeersUpdate ./channel-artifacts/ProcessorMSPanchors.tx -channelID scchannel -asOrg ProcessorMSP
set +x
