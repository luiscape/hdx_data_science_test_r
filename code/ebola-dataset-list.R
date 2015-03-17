# Scraper.R
library(RCurl)
library(rjson)


# Function to query HDX and collect a list of datasets
# that contain a certain tag.
getDatasetListforTag <- function(tag = NULL, verbose = FALSE) {

	# Checking arguments.
	if (is.null(tag)) stop("Please provide a tag.")

	cat("---------------------------------------------\n")
	cat("Collecting data from HDX ... \n")

	# Setting up query.
	u = paste0("https://data.hdx.rwlabs.org/api/action/tag_show?id=", tag)
	doc = fromJSON(getURL(u))

	# Proceed if query worked.
	if (doc$success == FALSE) stop("ERROR: couldn't connect.")
	if (doc$success == TRUE) {

		# Collecting only results from query.
		results = doc$result$packages
		for (i in 1:length(results)) {

			# Building data.frame for each record.
			it <- data.frame(
					title = results[[i]]$title,
					name = results[[i]]$name,
					owner_org = results[[i]]$owner_org,
					maintainer = results[[i]]$maintainer,
					maintainer_email = NA,
					revision_timestamp = results[[i]]$revision_timestamp,
					id = results[[i]]$id,
					num_resources = results[[i]]$num_resources,
					num_tags = results[[i]]$num_tags,
					num_extras = length(results[[i]]$extras)
					)

			# Assembling data.frame.
			if (i == 1) out <- it
			else out <- rbind(it)
		}

		# Checking if the results are correct.
		if (length(results) != nrow(out)) {
			cat("ERROR:\n")
			cat(length(results), "record(s) found.\n")
			cat(nrow(out), "record(s) written.\n")
		}
	}

	cat("---------------------------------------------\n")
	cat("****************** DONE *********************\n")
	cat("---------------------------------------------\n")

	return(out)
}

# Function to write the output into a data.frame
# to the file system.
writeOutput <- function(csv = TRUE, l = NULL) {
	if (is.null(l)) stop("Please provide a directory.")
	data <- getDatasetListforTag("ebola", FALSE)
	if (is.data.frame(data)) {
		cat("---------------------------------------------\n")
		cat("Writing CSV ... ")
		if (csv) write.csv(data, l, row.names = FALSE)
	}
	cat("done.\n")
	cat("---------------------------------------------\n")
}

# Running the function.
writeOutput(l = "data/ebola-dataset-list.csv")