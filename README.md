# OSMP Annotation Workflow

[OSMP](https://github.com/ccmbioinfo/osmp) is a tool that enables researchers to pull back variants and phenotypic information from various institutions. An important goal for uniting the data to have standardized annotation across different data nodes. We thereby implement a workflow that will be submitted as a job to the slurm scheduler on HPC4Health to retrieve annotation on single-nucleotide variants. The dedicated compute node on HPC allows the annotation to run as "on-the-fly" as possible, an important criteria for fast retrieval of genomic information. 

## <b>Nextflow</b>
Nextflow is used for data orchestration and parallel execution of various tasks required for annotation. 

The input to the workflow is a JSON string of variants that contain chromosome, reference allele, alternative alelle, and position as seen in [sample_variants.json](/jobs/sample_variants.json). Specifically, the chromosome, start, and end are used to perform an annotation query. 

Two main sources for annotation are used: [CADD VEP](https://cadd.gs.washington.edu/) and [gnomAD](https://gnomad.broadinstitute.org/). The diagram below illustrates the fields extracted from each.

![Static Annotation Flow](/assets/annotation.png)

## <b>Running your workflow</b>

To run the workflow locally, first make sure you are on a `qlogin` node on [HPC](hpc.ccm.sickkids.ca) and have loaded the appropriate modules:
```
module load nextflow Singularity
```

### Singularity

Singularity is a container engine alternative to Docker, which can be used with unprivileged permissions and doesn’t require a separate daemon process. These, along other features, makes Singularity a container engine better suited the requirements of HPC workloads. 

To run Nextflow with Singularity: 
```bash
cd jobs
nextflow run annotation.nf -profile annotation --json <your_fake_json> 
```

Note that there's a JSON string for test variants in [annotation.nf](/jobs/annotation.nf), so you can simply drop the `--json` flag and argument if you want to use the same test data. 

### Docker
Singularity is able to use existing Docker images, and pull from Docker registries. The Dockerfile [here](Dockerfile) is built and published to GitHub [here](https://github.com/ccmbioinfo/osmp-annotation/pkgs/container/osmp-annotation) when there's a push to the main development branch.


## <b>Workflow Summary</b> 
1. JSON string containing variants are converted into a CSV.
2. Unique variants are extracted, and their coordiates (`chr:start-end`) are printed. 
3. `tabix` is used to pull annotation information from CADD VEP and gnomAD.
4. Annotations and original variants are merged. A JSON is returned, which will subsequently be sent through the Slurm API to OSMP's backend.

![Annotation DAG](/assets/flowchart.png)

### Tabix

The main annotation step relies on [`tabix`](http://www.htslib.org/doc/tabix.html), which is a tool used to index a TAB-delimited genome position file and creates an index file. After indexing, tabix is able to quickly retrieve data lines overlapping regions specified in the format "chr:beginPos-endPos". (Coordinates specified in this region format are 1-based and inclusive.)

Both CADD VEP and gnomAD TSVs and their indexes produced from `tabix` are stored on HPF's data node. 

### Visualization

To see a DAG of your workflow execution, run: 
```bash
nextflow run annotation.nf -with-dag flowchart.png
```
