#!/usr/bin/env nextflow   

// params.json = '[{"start":53715075,"end":53715075,"referenceName":1,"ref":"A","alt":"C","originalCoordinate":"GRCh37"},{"start":31656524,"end":31656524,"referenceName":6,"ref":"A","alt":"C","originalCoordinate":"GRCh37"},{"start":31656524,"end":31656524,"referenceName":6,"ref":"A","alt":"C", "originalCoordinate":"GRCh38"}]'

params.json = '[{"start":5,"end":5,"referenceName":1,"ref":"A","alt":"C","originalCoordinate":"GRCh37"},{"start":53715075,"end":53715075,"referenceName":1,"ref":"A","alt":"C","originalCoordinate":"GRCh38"}]'


json_ch = Channel.from(params.json)
assemblyNumber="GRCh38"

// Index file for Tabix
baseDir = '/hpf/largeprojects/ccmbio/osmp'
caddIndex = "${baseDir}/whole_genome_SNVs_inclAnno_GRCh37.tsv.gz.csi"
caddAnnotationUrl = "${baseDir}/whole_genome_SNVs_inclAnno_GRCh37.tsv.gz"
gnomadIndex = "${baseDir}/gnomAD_GRCh37.tsv.gz.csi"
gnomadAnnotationFile = "${baseDir}/gnomAD_GRCh37.tsv.gz"

// Files for liftover
hg19ToHg38="${baseDir}/hg19ToHg38.over.chain"
hg38ToHg19="${baseDir}/hg38ToHg19.over.chain"

process liftover{

    input:
    val v from json_ch
    val assembly from assemblyNumber

    output:
    stdout into result

    script: 
    """
    bash $workflow.projectDir/scripts/run-liftover.sh '$v' '$assembly' '$hg19ToHg38' '$hg38ToHg19'
    """
}
result.view()

// process convertVariantsToCSV {

//     input:
//     val v from json_ch

//     output:
//     file "variants.csv" into variants_ch_1
//     file "variants.csv" into variants_ch_2

//     script:
//     """
//     python $workflow.projectDir/scripts/json2csv.py --json '$v' > variants.csv
//     """
// }

// process getUniqueVariants {

//     input:
//     val v from variants_ch_1

//     output: 
//     stdout into unique_variants_1
//     stdout into unique_variants_2

//     script: 
//     """
//     python $workflow.projectDir/scripts/get_unique_variants.py --variants $v
//     """
// }

// /**
//     Column indexes for CADD annotation
//     1: #Chrom
//     2: Pos
//     3: Ref
//     4: Alt
//     8: Consequence
//     17: oAA
//     18: nAA
//     20: FeatureID
//     25: cDNApos
//     29: protPos
// **/

// process queryCADD {

//     input:
//     val u from unique_variants_1

//     output: 
//     file "cadd.tsv" into cadd_annotation 
    
//     script:
//     """
//     tabix -D -h $caddAnnotationUrl $caddIndex $u | awk 'NR!=1{print \$1,\$2,\$3,\$4,\$8,\$17,\$18,\$20,\$25,\$29}' >  cadd.tsv
//     """
// }

// /**
//     Column indexes for gnomAD annotation
//     1: chrom
//     2: pos
//     3: ref
//     4: alt
//     5: nhomalt
//     6: an
//     7: af
//     8: filter
//     9: gene
//     10: transcript
//     11: cdna
//     12: amino_acids
//     13: assembly
//     14: type
// **/

// process queryGnomAD {

//     input: 
//     val u from unique_variants_2

//     output:
//     file "gnomad.tsv" into gnomad_annotation

//     script:
//     """
//     tabix -D -h $gnomadAnnotationFile $gnomadIndex $u | awk -F '\t' '{print \$1, \$2, \$3, \$4, \$5, \$6, \$7, \$8, \$10, \$11, \$12}' >  gnomad.tsv 
//     """
// }

// process mergeAnnotations {
//     input: 
//     val v from variants_ch_2
//     val g from gnomad_annotation
//     val c from cadd_annotation

//     output:
//     stdout into annotated_variants
    
//     script:
//     """
//     python $workflow.projectDir/scripts/annotate.py --variants '$v' --cadd '$c' --gnomad '$g' 
//     """
// }

// annotated_variants.view()
