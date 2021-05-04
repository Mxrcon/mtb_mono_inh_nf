nextflow.enable.dsl = 2

params.resultsDir = "${params.outdir}/fastqc"
params.saveMode = 'copy'
params.shouldPublish = true


process MULTIQC {
    publishDir params.resultsDir, mode: params.saveMode, enabled: params.shouldPublish

    input:
    path("""${params.fastqcResultsDir}""") from ch_in_multiqc

    output:
    tuple path("""multiqc_data"""),
            path("""multiqc_report.html""") into ch_out_multiqc


    script:

    """
    multiqc ${params.fastqcResultsDir}
    """

}






