# HDX Data Scientist Test
This repository contains a broken script that needs to be fixed. The script contains 3 errors:

1. The main function fails to run.
2. The columns of the CSV output are improperly organized or have wrong input.
3. Some records fail to be written in the output CSV file.

You should be able to identify the source of all the errors above and be able to fix them, making sure that the script runs successully and that the output CSV file is correct.

## Script Objective
The `ebola-dataset-list.R` script queries the [Humanitarian Data Exchange API](http://docs.ckan.org/) and creates a CSV file with the results of the query. We are interested in getting a table with all datasets that contain the tag "ebola". The table should contain a subset of the number of metadata fields available in the query result, but not all of them.

The CSV file available in this repository contains the results of a run with the broken script. The objective is to generate that file, but without the errors it currently presents. That sample CSV file can be found [here](data/dataset-list.csv).

## Getting Started
The first step is to **clone** this repository locally -- (*do not fork!*). You will work on the solution on your local computer. When done, you can submit the whole repository as a `ZIP` package to the evaluation team via email.

Make sure you have `R 3.0+` installed in your system. Also, remember to install this script's dependencies:

```R
> install.packages('RCurl')
> install.packages('rjson')
```

## Usage
If you are using an UNIX system, we recommend using the `run.sh` script as follows:

```bash
$ bash run.sh
```

Or if you would like to run it direcly using R, you can run:

```bash
$ Rscript code/ebola-dataset-list.R
```

Either approach above will throw an error. That's when the test starts. Good luck!