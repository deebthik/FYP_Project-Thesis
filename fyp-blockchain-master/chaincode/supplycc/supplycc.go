package main

import (
	"fmt"

	"github.com/hyperledger/fabric/core/chaincode/shim"
	pb "github.com/hyperledger/fabric/protos/peer"
)

// SupplyChainContract - basic smart contract structure
type SupplyChainContract struct {
}

// Init is called when the chaincode is instantiated
func (c *SupplyChainContract) Init(stub shim.ChaincodeStubInterface) pb.Response {
	return shim.Success(nil)
}

// Invoke is called when data needs to be written to the blockchain
func (c *SupplyChainContract) Invoke(stub shim.ChaincodeStubInterface) pb.Response {
	function, args := stub.GetFunctionAndParameters()

	switch function {
	case "createBatch":
		return createBatch(stub, args)
	case "updateBatch":
		return updateBatch(stub, args)
	case "queryBatch":
		return queryBatch(stub, args)
	case "queryBatchList":
		return queryBatchList(stub)

	// Testing methods
	case "testCreate":
		return testCreate(stub)
	case "testUpdate":
		return testUpdate(stub, args)
	default:
		return shim.Error(function + " function does not exist")
	}
}

// The main function is only relevant in unit test mode. Only included here for completeness.
func main() {

	// Create a new Smart Contract
	err := shim.Start(new(SupplyChainContract))
	if err != nil {
		fmt.Printf("Error creating new Smart Contract: %s", err)
	}
}
