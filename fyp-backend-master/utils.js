module.exports = {
    processBatchList: (batchList) => {
        let temp = batchList
        let data_list = [];
        for (let i = 0; i < temp.length; i++) {
        let temp2 = temp[i];
        if (temp2.stage === "cultivation") {
            data_list.push({
            BatchId: temp2.id,
            CultivationStage: "Completed",
            FarmInspectorStage: "Processing",
            HarvesterStage: "Not available",
            ExporterStage: "Not available",
            ImporterStage: "Not available",
            ProcessorStage: "Not available"
            });
            
        } else if (temp2.stage === "farm-inspector") {
            data_list.push({
            BatchId: temp2.id,
            CultivationStage: "Completed",
            FarmInspectorStage: "Completed",
            HarvesterStage: "Processing",
            ExporterStage: "Not available",
            ImporterStage: "Not available",
            ProcessorStage: "Not available"
            });
            
        } else if (temp2.stage === "harvester") {
            data_list.push({
            BatchId: temp2.id,
            CultivationStage: "Completed",
            FarmInspectorStage: "Completed",
            HarvesterStage: "Completed",
            ExporterStage: "Processing",
            ImporterStage: "Not available",
            ProcessorStage: "Not available"
            });
        } else if (temp2.stage === "exporter") {
            data_list.push({
            BatchId: temp2.id,
            CultivationStage: "Completed",
            FarmInspectorStage: "Completed",
            HarvesterStage: "Completed",
            ExporterStage: "Completed",
            ImporterStage: "Processing",
            ProcessorStage: "Not available"
            });
        } else if (temp2.stage === "importer") {
            data_list.push({
            BatchId: temp2.id,
            CultivationStage: "Completed",
            FarmInspectorStage: "Completed",
            HarvesterStage: "Completed",
            ExporterStage: "Completed",
            ImporterStage: "Completed",
            ProcessorStage: "Processing"
            });
        } else if (temp2.stage === "processor") {
            data_list.push({
            BatchId: temp2.id,
            CultivationStage: "Completed",
            FarmInspectorStage: "Completed",
            HarvesterStage: "Completed",
            ExporterStage: "Completed",
            ImporterStage: "Completed",
            ProcessorStage: "Completed"
            });
        }
    }

    return data_list;
    }
}