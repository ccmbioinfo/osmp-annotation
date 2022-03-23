#!/usr/bin/env nextflow   

params.json = '[{"start":31656524,"end":31656524,"referenceName":6,"ref":"A","alt":"C"},{"start":31656524,"end":31656524,"referenceName":6,"ref":"A","alt":"C"},{"start":31656524,"end":31656524,"referenceName":6,"ref":"A","alt":"C"},{"start":31656035,"end":31656035,"referenceName":6,"ref":"A","alt":"G"},{"start":31656035,"end":31656035,"referenceName":6,"ref":"A","alt":"G"},{"start":31656035,"end":31656035,"referenceName":6,"ref":"A","alt":"G"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31660879,"end":31660879,"referenceName":6,"ref":"C","alt":"A"},{"start":31670463,"end":31670463,"referenceName":6,"ref":"C","alt":"A"},{"start":31670463,"end":31670463,"referenceName":6,"ref":"C","alt":"A"},{"start":31670463,"end":31670463,"referenceName":6,"ref":"C","alt":"A"},{"start":31670463,"end":31670463,"referenceName":6,"ref":"C","alt":"A"},{"start":31670974,"end":31670974,"referenceName":6,"ref":"C","alt":"G"},{"start":31670974,"end":31670974,"referenceName":6,"ref":"C","alt":"G"},{"start":31670974,"end":31670974,"referenceName":6,"ref":"C","alt":"G"},{"start":31670974,"end":31670974,"referenceName":6,"ref":"C","alt":"G"},{"start":31655601,"end":31655601,"referenceName":6,"ref":"C","alt":"T"},{"start":31655601,"end":31655601,"referenceName":6,"ref":"C","alt":"T"},{"start":31655601,"end":31655601,"referenceName":6,"ref":"C","alt":"T"},{"start":31655854,"end":31655854,"referenceName":6,"ref":"C","alt":"T"},{"start":31655854,"end":31655854,"referenceName":6,"ref":"C","alt":"T"},{"start":31655854,"end":31655854,"referenceName":6,"ref":"C","alt":"T"},{"start":31659581,"end":31659581,"referenceName":6,"ref":"C","alt":"T"},{"start":31659666,"end":31659666,"referenceName":6,"ref":"C","alt":"T"},{"start":31659666,"end":31659666,"referenceName":6,"ref":"C","alt":"T"},{"start":31659666,"end":31659666,"referenceName":6,"ref":"C","alt":"T"},{"start":31659666,"end":31659666,"referenceName":6,"ref":"C","alt":"T"},{"start":31659666,"end":31659666,"referenceName":6,"ref":"C","alt":"T"},{"start":31660714,"end":31660714,"referenceName":6,"ref":"C","alt":"T"},{"start":31660714,"end":31660714,"referenceName":6,"ref":"C","alt":"T"},{"start":31660714,"end":31660714,"referenceName":6,"ref":"C","alt":"T"},{"start":31664780,"end":31664780,"referenceName":6,"ref":"C","alt":"T"},{"start":31664780,"end":31664780,"referenceName":6,"ref":"C","alt":"T"},{"start":31664780,"end":31664780,"referenceName":6,"ref":"C","alt":"T"},{"start":31664801,"end":31664801,"referenceName":6,"ref":"C","alt":"T"},{"start":31664801,"end":31664801,"referenceName":6,"ref":"C","alt":"T"},{"start":31664801,"end":31664801,"referenceName":6,"ref":"C","alt":"T"},{"start":31664801,"end":31664801,"referenceName":6,"ref":"C","alt":"T"},{"start":31664801,"end":31664801,"referenceName":6,"ref":"C","alt":"T"},{"start":31669880,"end":31669880,"referenceName":6,"ref":"C","alt":"T"},{"start":31669880,"end":31669880,"referenceName":6,"ref":"C","alt":"T"},{"start":31669880,"end":31669880,"referenceName":6,"ref":"C","alt":"T"},{"start":31655855,"end":31655855,"referenceName":6,"ref":"G","alt":"A"},{"start":31655855,"end":31655855,"referenceName":6,"ref":"G","alt":"A"},{"start":31655855,"end":31655855,"referenceName":6,"ref":"G","alt":"A"},{"start":31656018,"end":31656018,"referenceName":6,"ref":"G","alt":"A"},{"start":31660795,"end":31660795,"referenceName":6,"ref":"G","alt":"A"},{"start":31660795,"end":31660795,"referenceName":6,"ref":"G","alt":"A"},{"start":31660795,"end":31660795,"referenceName":6,"ref":"G","alt":"A"},{"start":31660835,"end":31660835,"referenceName":6,"ref":"G","alt":"A"},{"start":31660835,"end":31660835,"referenceName":6,"ref":"G","alt":"A"},{"start":31660835,"end":31660835,"referenceName":6,"ref":"G","alt":"A"},{"start":31660835,"end":31660835,"referenceName":6,"ref":"G","alt":"A"},{"start":31670982,"end":31670982,"referenceName":6,"ref":"G","alt":"A"},{"start":31670982,"end":31670982,"referenceName":6,"ref":"G","alt":"A"},{"start":31670982,"end":31670982,"referenceName":6,"ref":"G","alt":"A"},{"start":31655033,"end":31655033,"referenceName":6,"ref":"T","alt":"C"},{"start":31655313,"end":31655313,"referenceName":6,"ref":"T","alt":"C"},{"start":31655313,"end":31655313,"referenceName":6,"ref":"T","alt":"C"},{"start":31655313,"end":31655313,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31655512,"end":31655512,"referenceName":6,"ref":"T","alt":"C"},{"start":31660759,"end":31660759,"referenceName":6,"ref":"T","alt":"C"},{"start":31668747,"end":31668747,"referenceName":6,"ref":"T","alt":"C"},{"start":31668747,"end":31668747,"referenceName":6,"ref":"T","alt":"C"},{"start":31668747,"end":31668747,"referenceName":6,"ref":"T","alt":"C"},{"start":31668747,"end":31668747,"referenceName":6,"ref":"T","alt":"C"},{"start":31670490,"end":31670490,"referenceName":6,"ref":"T","alt":"C"},{"start":31670490,"end":31670490,"referenceName":6,"ref":"T","alt":"C"},{"start":31670490,"end":31670490,"referenceName":6,"ref":"T","alt":"C"},{"start":31660856,"end":31660856,"referenceName":6,"ref":"TC","alt":"T"},{"start":31660856,"end":31660856,"referenceName":6,"ref":"TC","alt":"T"},{"start":31660856,"end":31660856,"referenceName":6,"ref":"TC","alt":"T"},{"start":31655056,"end":31655056,"referenceName":6,"ref":"TGCA","alt":"T"},{"start":31655056,"end":31655056,"referenceName":6,"ref":"TGCA","alt":"T"}]'
json_ch = Channel.from(params.json)

// Index file for Tabix
baseDir = '/hpf/largeprojects/ccmbio/osmp'
caddIndex = "${baseDir}/whole_genome_SNVs_inclAnno_GRCh37.tsv.gz.csi"
caddAnnotationUrl = "${baseDir}/whole_genome_SNVs_inclAnno_GRCh37.tsv.gz"
gnomadIndex = "${baseDir}/gnomAD_GRCh37.tsv.gz.csi"
gnomadAnnotationFile = "${baseDir}/gnomAD_GRCh37.tsv.gz"

process convertVariantsToCSV {

    input:
    val v from json_ch

    output:
    file "variants.csv" into variants_ch_1
    file "variants.csv" into variants_ch_2

    script:
    """
    python $workflow.projectDir/scripts/json2csv.py --json '$v' > variants.csv
    """
}

process getUniqueVariants {

    input:
    val v from variants_ch_1

    output: 
    stdout into unique_variants_1
    stdout into unique_variants_2

    script: 
    """
    python $workflow.projectDir/scripts/get_unique_variants.py --variants $v
    """
}

/**
    Column indexes for CADD annotation
    1: #Chrom
    2: Pos
    3: Ref
    4: Alt
    8: Consequence
    17: oAA
    18: nAA
    20: FeatureID
    25: cDNApos
    29: protPos
**/

process queryCADD {

    input:
    val u from unique_variants_1

    output: 
    file "cadd.tsv" into cadd_annotation 
    
    script:
    """
    tabix -D -h $caddAnnotationUrl $caddIndex $u | awk 'NR!=1{print \$1,\$2,\$3,\$4,\$8,\$17,\$18,\$20,\$25,\$29}' >  cadd.tsv
    """
}

/**
    Column indexes for gnomAD annotation
    1: chrom
    2: pos
    3: ref
    4: alt
    5: nhomalt
    6: an
    7: af
    8: filter
    9: gene
    10: transcript
    11: cdna
    12: amino_acids
    13: assembly
    14: type
**/

process queryGnomAD {

    input: 
    val u from unique_variants_2

    output:
    file "gnomad.tsv" into gnomad_annotation

    script:
    """
    tabix -D -h $gnomadAnnotationFile $gnomadIndex $u | awk -F '\t' '{print \$1, \$2, \$3, \$4, \$5, \$6, \$7, \$8, \$10, \$11, \$12}' >  gnomad.tsv 
    """
}

process mergeAnnotations {
    input: 
    val v from variants_ch_2
    val g from gnomad_annotation
    val c from cadd_annotation

    output:
    stdout into annotated_variants
    
    script:
    """
    python $workflow.projectDir/scripts/annotate.py --variants '$v' --cadd '$c' --gnomad '$g' 
    """
}

annotated_variants.view()
