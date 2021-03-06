# author: Jimmy Liu and Hannah McSorley
# date: 03-06-2020

doc <- "This script will load the data set from a URL

Usage: load_data.R --data_url=<url_to_raw_data_file> --output=</path/to/output_filename>
"

# load library
suppressMessages(library(docopt))
suppressMessages(library(here))
suppressMessages(library(tidyverse))
suppressMessages(library(glue))

# define arguments
opt <- docopt(doc)

# main function: read csv from web

main <- function(data_url){
  
  # download data file and save
  print(glue("[",as.character(Sys.time()),"] Reading data file from public repo: ", opt$data_url))
  
  datafile <- download.file(data_url, here(opt$output)) 
  
  print(glue("[",as.character(Sys.time()),"] Datafile downloaded..."))
  
  print(glue("[",as.character(Sys.time()),"] Raw datafile saved to: ", opt$output))

}

# call for result of main function
main(opt$data_url)
