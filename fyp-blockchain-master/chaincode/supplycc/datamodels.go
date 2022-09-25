package main

// string constants for utility purposes
const (
	// String constants defining the stages
	CultivationStage   string = "cultivation"
	FarmInspectorStage string = "farm-inspector"
	HarvesterStage     string = "harvester"
	ExporterStage      string = "exporter"
	ImporterStage      string = "importer"
	ProcessorStage     string = "processor"
	// BatchData object type
	BatchDetails string = "batch-details"
)

// BatchData - Structure to store batchIDs and stages for easy querying
type BatchData struct {
	ObjectType string `json:"object-type"`
	BatchID    string `json:"id"`
	Stage      string `json:"stage"`
}

// CultivationData - Cultivation block structure
type CultivationData struct {
	BatchID      string `json:"id"`
	Stage        string `json:"stage"`
	FarmerName   string `json:"farmer-name"`
	FarmAddress  string `json:"farm-address"`
	ExporterName string `json:"exporter-name"`
	ImporerName  string `json:"importer-name"`
	Timestamp    string `json:"timestamp"`
}

// FarmInspectorData - FarmInspector block structure
type FarmInspectorData struct {
	BatchID        string `json:"id"`
	Stage          string `json:"stage"`
	SeedType       string `json:"seed-type"`
	CoffeeFamily   string `json:"coffee-family"`
	FertilizerUsed string `json:"fertilizer-used"`
	Timestamp      string `json:"timestamp"`
}

// HarvesterData - Harvester block structure
type HarvesterData struct {
	BatchID     string  `json:"id"`
	Stage       string  `json:"stage"`
	CropVariety string  `json:"crop-variety"`
	Temperature float32 `json:"temperature"` // in deg C
	Humidity    float32 `json:"humidity"`    // in %
	Timestamp   string  `json:"timestamp"`
}

// ExporterData - Exporter block structure
type ExporterData struct {
	BatchID              string  `json:"id"`
	Stage                string  `json:"stage"`
	Quantity             float32 `json:"quantity"` // in kg
	DestinationAddress   string  `json:"destination-address"`
	ShipName             string  `json:"ship-name"`
	ShipNo               string  `json:"ship-no"`
	DepartureDateTime    string  `json:"departure-date-time"`
	EstimatedArrivalTime string  `json:"estimated-arrival-time"`
	ExporterID           int     `json:"exporter-id"`
	Timestamp            string  `json:"timestamp"`
}

// ImporterData - Importer block structure
type ImporterData struct {
	BatchID          string `json:"id"`
	Stage            string `json:"stage"`
	ShipName         string `json:"ship-name"`
	ShipNo           string `json:"ship-no"`
	ArrivalDateTime  string `json:"arrival-date-time"`
	TransportInfo    string `json:"transport-info"`
	WarehouseName    string `json:"warehouse-name"`
	WarehouseAddress string `json:"warehouse-address"`
	ImporterID       int    `json:"importer-id"`
	Timestamp        string `json:"timestamp"`
}

// ProcessorData - Processor block structure
type ProcessorData struct {
	BatchID          string  `json:"id"`
	Stage            string  `json:"stage"`
	Temperature      float32 `json:"temperature"`       // in deg C
	RoastingDuration int     `json:"roasting-duration"` // in seconds
	PackageDateTime  string  `json:"package-date-time"`
	ProcessorName    string  `json:"processor-name"`
	WarehouseAddress string  `json:"warehouse-address"`
	Timestamp        string  `json:"timestamp"`
}

// BatchHistory - structure to consolidate all stages of a single batch
type BatchHistory struct {
	CultivationData   CultivationData
	FarmInspectorData FarmInspectorData
	HarvesterData     HarvesterData
	ExporterData      ExporterData
	ImporterData      ImporterData
	ProcessorData     ProcessorData
}
