package main

import (
	"encoding/json"
	"time"

	"github.com/hyperledger/fabric/core/chaincode/shim"
	pb "github.com/hyperledger/fabric/protos/peer"
	"github.com/segmentio/ksuid"
)

/* createBatch - function to create a batch that starts off the supply chain
Expects two arguments:
1. Stringified Cultivation details
	eg: "{\"farmer-name\":\"Reliance Farm\",\"farm-address\":\"Nashik, Maharashtra, India\",\"exporter-name\":\"Express Export & Import Service\",\"importer-name\":\"FQ Export & Import Service\"}"
*/
func createBatch(stub shim.ChaincodeStubInterface, args []string) pb.Response {
	if len(args) != 1 {
		return shim.Error("Incorrect number of arguments")
	}

	var cData CultivationData
	cData.BatchID = ksuid.New().String()
	cData.Timestamp = time.Now().String()
	if err := json.Unmarshal([]byte(args[0]), &cData); err != nil {
		return shim.Error(err.Error())
	}

	cData.Stage = CultivationStage

	batch := BatchData{
		BatchID:    cData.BatchID,
		Stage:      CultivationStage,
		ObjectType: BatchDetails}

	batchAsBytes, _ := json.Marshal(batch)
	stub.PutState(batch.BatchID, batchAsBytes)

	cKey, _ := stub.CreateCompositeKey(CultivationStage, []string{cData.BatchID})
	cDataAsBytes, _ := json.Marshal(cData)
	stub.PutState(cKey, cDataAsBytes)

	return shim.Success(cDataAsBytes)
}

/*
updateBatch - function to update details for existing batch of the supply chain
Expects 3 arguments:
1. BatchID
2. Next Stage: Eg: if the last completed stage was cultivation, argument provided for the function should be farminspector
3. Next Stage Data: stringified Json data corresponding to the new stage
*/
func updateBatch(stub shim.ChaincodeStubInterface, args []string) pb.Response {
	if len(args) != 3 {
		return shim.Error("Incorrect number of Arguments")
	}

	batchId := args[0]
	nextStage := args[1]

	batchAsBytes, err := stub.GetState(batchId)
	if err != nil {
		return shim.Error(err.Error()) // Given BatchID does not exist
	}

	var batch BatchData
	json.Unmarshal(batchAsBytes, &batch)
	if (batch.Stage == CultivationStage) && (nextStage != FarmInspectorStage) ||
		(batch.Stage == FarmInspectorStage) && (nextStage != HarvesterStage) ||
		(batch.Stage == HarvesterStage) && (nextStage != ExporterStage) ||
		(batch.Stage == ExporterStage) && (nextStage != ImporterStage) ||
		(batch.Stage == ImporterStage) && (nextStage != ProcessorStage) {
		return shim.Error(nextStage + " stage cannot be updated from the current stage")
	}

	switch nextStage {
	case FarmInspectorStage:
		var data FarmInspectorData
		data.BatchID = batchId
		data.Stage = nextStage
		data.Timestamp = time.Now().String()
		if err := json.Unmarshal([]byte(args[2]), &data); err != nil {
			return shim.Error(err.Error())
		}

		batch := BatchData{
			BatchID:    batchId,
			Stage:      nextStage,
			ObjectType: BatchDetails}

		batchAsBytes, _ := json.Marshal(batch)
		stub.PutState(batch.BatchID, batchAsBytes)

		key, _ := stub.CreateCompositeKey(nextStage, []string{batchId})
		dataAsBytes, _ := json.Marshal(data)
		stub.PutState(key, dataAsBytes)

		return shim.Success(dataAsBytes)

	case HarvesterStage:
		var data HarvesterData
		data.BatchID = batchId
		data.Stage = nextStage
		data.Timestamp = time.Now().String()
		if err := json.Unmarshal([]byte(args[2]), &data); err != nil {
			return shim.Error(err.Error())
		}

		batch := BatchData{
			BatchID:    batchId,
			Stage:      nextStage,
			ObjectType: BatchDetails}

		batchAsBytes, _ := json.Marshal(batch)
		stub.PutState(batch.BatchID, batchAsBytes)

		key, _ := stub.CreateCompositeKey(nextStage, []string{batchId})
		dataAsBytes, _ := json.Marshal(data)
		stub.PutState(key, dataAsBytes)

		return shim.Success(dataAsBytes)

	case ExporterStage:
		var data ExporterData
		data.BatchID = batchId
		data.Stage = nextStage
		data.Timestamp = time.Now().String()
		if err := json.Unmarshal([]byte(args[2]), &data); err != nil {
			return shim.Error(err.Error())
		}

		batch := BatchData{
			BatchID:    batchId,
			Stage:      nextStage,
			ObjectType: BatchDetails}

		batchAsBytes, _ := json.Marshal(batch)
		stub.PutState(batch.BatchID, batchAsBytes)

		key, _ := stub.CreateCompositeKey(nextStage, []string{batchId})
		dataAsBytes, _ := json.Marshal(data)
		stub.PutState(key, dataAsBytes)

		return shim.Success(dataAsBytes)

	case ImporterStage:
		var data ImporterData
		data.BatchID = batchId
		data.Stage = nextStage
		data.Timestamp = time.Now().String()
		if err := json.Unmarshal([]byte(args[2]), &data); err != nil {
			return shim.Error(err.Error())
		}

		batch := BatchData{
			BatchID:    batchId,
			Stage:      nextStage,
			ObjectType: BatchDetails}

		batchAsBytes, _ := json.Marshal(batch)
		stub.PutState(batch.BatchID, batchAsBytes)

		key, _ := stub.CreateCompositeKey(nextStage, []string{batchId})
		dataAsBytes, _ := json.Marshal(data)
		stub.PutState(key, dataAsBytes)

		return shim.Success(dataAsBytes)

	case ProcessorStage:
		var data ProcessorData
		data.BatchID = batchId
		data.Stage = nextStage
		data.Timestamp = time.Now().String()
		if err := json.Unmarshal([]byte(args[2]), &data); err != nil {
			return shim.Error(err.Error())
		}

		batch := BatchData{
			BatchID:    batchId,
			Stage:      nextStage,
			ObjectType: BatchDetails}

		batchAsBytes, _ := json.Marshal(batch)
		stub.PutState(batch.BatchID, batchAsBytes)

		key, _ := stub.CreateCompositeKey(nextStage, []string{batchId})
		dataAsBytes, _ := json.Marshal(data)
		stub.PutState(key, dataAsBytes)

		return shim.Success(dataAsBytes)

	default:
		return shim.Error("Unknown error occured")
	}

}

/* queryBatch - function the fetch details of one batch
Expects 1 argument:
1. BatchID
*/
func queryBatch(stub shim.ChaincodeStubInterface, args []string) pb.Response {
	if len(args) != 1 {
		return shim.Error("Incorrect number of arguments")
	}

	batchAsBytes, err := stub.GetState(args[0])
	if err != nil {
		return shim.Error(err.Error()) // Given BatchID does not exist
	}

	var batch BatchData
	json.Unmarshal(batchAsBytes, &batch)

	batchHistory, err := getBatchHistory(stub, batch)
	if err != nil {
		return shim.Error(err.Error())
	}

	batchHistoryAsBytes, _ := json.Marshal(batchHistory)
	return shim.Success(batchHistoryAsBytes)
}

// getBatchHistory - function to iterate through the various stages and consolidate batch history
func getBatchHistory(stub shim.ChaincodeStubInterface, batch BatchData) (BatchHistory, error) {
	var batchHistory BatchHistory

	currentStage := CultivationStage
	key, _ := stub.CreateCompositeKey(currentStage, []string{batch.BatchID})
	data, err := stub.GetState(key)
	if err != nil {
		return BatchHistory{}, err
	}
	json.Unmarshal(data, &batchHistory.CultivationData)
	if currentStage == batch.Stage {
		return batchHistory, nil
	}

	currentStage = FarmInspectorStage
	key, _ = stub.CreateCompositeKey(currentStage, []string{batch.BatchID})
	data, err = stub.GetState(key)
	if err != nil {
		return BatchHistory{}, err
	}
	json.Unmarshal(data, &batchHistory.FarmInspectorData)
	if currentStage == batch.Stage {
		return batchHistory, nil
	}

	currentStage = HarvesterStage
	key, _ = stub.CreateCompositeKey(currentStage, []string{batch.BatchID})
	data, err = stub.GetState(key)
	if err != nil {
		return BatchHistory{}, err
	}
	json.Unmarshal(data, &batchHistory.HarvesterData)
	if currentStage == batch.Stage {
		return batchHistory, nil
	}

	currentStage = ExporterStage
	key, _ = stub.CreateCompositeKey(currentStage, []string{batch.BatchID})
	data, err = stub.GetState(key)
	if err != nil {
		return BatchHistory{}, err
	}
	json.Unmarshal(data, &batchHistory.ExporterData)
	if currentStage == batch.Stage {
		return batchHistory, nil
	}

	currentStage = ImporterStage
	key, _ = stub.CreateCompositeKey(currentStage, []string{batch.BatchID})
	data, err = stub.GetState(key)
	if err != nil {
		return BatchHistory{}, err
	}
	json.Unmarshal(data, &batchHistory.ImporterData)
	if currentStage == batch.Stage {
		return batchHistory, nil
	}

	currentStage = ProcessorStage
	key, _ = stub.CreateCompositeKey(currentStage, []string{batch.BatchID})
	data, err = stub.GetState(key)
	if err != nil {
		return BatchHistory{}, err
	}
	json.Unmarshal(data, &batchHistory.ProcessorData)

	return batchHistory, nil
}

func queryBatchList(stub shim.ChaincodeStubInterface) pb.Response {
	queryString := "{\"selector\":{\"object-type\":\"batch-details\"}}"
	resultsIterator, err := stub.GetQueryResult(queryString)
	if err != nil {
		return shim.Error(err.Error())
	}

	var batchList []BatchData

	defer resultsIterator.Close()
	for resultsIterator.HasNext() {
		res, err := resultsIterator.Next()
		if err != nil {
			return shim.Error(err.Error())
		}

		rawItem, err := stub.GetState(res.Key)
		if err != nil {
			return shim.Error(err.Error())
		}

		var batch BatchData
		if err = json.Unmarshal(rawItem, &batch); err != nil {
			return shim.Error(err.Error())
		}

		batchList = append(batchList, batch)
	}

	packet, err := json.Marshal(batchList)
	if err != nil {
		return shim.Error(err.Error())
	}
	return shim.Success(packet)
}
