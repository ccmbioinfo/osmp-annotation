#!/usr/bin/env nextflow   

assemblyNumber="GRCh38"

baseDir = '/hpf/largeprojects/ccmbio/osmp'

// Files for liftover
hg19ToHg38="${baseDir}/liftover/hg19ToHg38.over.chain"
hg38ToHg19="${baseDir}/liftover/hg38ToHg19.over.chain"

// Input sample files in Json format 
hg19SampleInput="${baseDir}/liftover/input/hg19_input_json.txt"
hg38SampleInput="${baseDir}/liftover/input/hg38_input_json.txt"

// Processed input sample files in Json format
hg19SampleInputProcessed="${baseDir}/liftover/input/hg19_input_json_processed.txt"   // populated 
hg38SampleInputProcessed="${baseDir}/liftover/input/hg38_input_json_processed.txt"   // not populated

// Input sample files in Bed format. These files are only needed for the online UCSC liftover tool. 
hg19SampleInputBed="${baseDir}/liftover/input/hg19_input.bed" // populated
hg38SampleInputBed="${baseDir}/liftover/input/hg38_input.bed" // not populated 

// Output files in Bed format 
hg19SampleOutputLifted="${baseDir}/liftover/output/hg19_lifted.bed"           // populated
hg19SampleOutputUnlifted="${baseDir}/liftover/output/hg19_unlifted.bed"       //populated 
hg38SampleOutputLifted="${baseDir}/liftover/output/hg38_lifted.bed"           // not populated
hg38SampleOutputUnlifted="${baseDir}/liftover/output/hg38_unlifted.bed"       //not populated 

// Validation files in Bed format (obtained using the online UCSC liftover tool: https://genome.ucsc.edu/cgi-bin/hgLiftOver )
hg19ValidationLifted="${baseDir}/liftover/validation/hg19_lifted_validation.bed"           // populated
hg19ValidationUnlifted="${baseDir}/liftover/validation/hg19_unlifted_validation.txt"       //populated 


// Process input sample files in JSON format with correct field names. The output is in JSON format
// process sampleFiles{

//     script:
//     """
//     bash $workflow.projectDir/scripts/convert-samples.sh $hg19SampleInput $hg19SampleInputProcessed
//     """
// }

//Run Liftover command line tool. $hg19SampleOutputLifted' '$hg19SampleOutputUnlifted' are populated with the results. The input has a "," before the closing bracket. Need to delete this ","
// process liftover{

//     input:
//     val assembly from assemblyNumber

//     script: 
//     """
//     bash $workflow.projectDir/scripts/run-liftover-test.sh '$hg19SampleInputProcessed' '$assembly' '$hg19ToHg38' '$hg38ToHg19' '$hg19SampleOutputLifted' '$hg19SampleOutputUnlifted' 
//     """
// }

// convert BED format to position format: start + 1


// The content of $hg19SampleOutputLifted should match the content of $hg19ValidationLifted
// The content of $hg19SampleOutputUnlifted should match the content of $hg19ValidationUnlifted