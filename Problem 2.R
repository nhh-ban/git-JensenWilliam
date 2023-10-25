# Loading library
library(tidyverse)
library(dplyr)
# Test William
# Importing data 
raw_file = readLines(con = "http://www.sao.ru/lv/lvgdb/article/suites_dw_Table1.txt", warn = FALSE)

# Extract the first two characters from each element in the 'raw_file' vector.
substr(x = raw_file, start = 1, stop = 2)

# Finding the line number (L) where the line starts with "--" and pick the first occurrence.
L = 
  which(substr(x = raw_file, start = 1, stop = 2) == "--") %>% 
  min()

# Save the variable descriptions in a text file
cat(raw_file[1:(L - 2)], sep = "\n", file = "variable_descriptions.txt")


# Extract the variable names from raw_file[L-1]
variable_names = 
  strsplit(x = raw_file[L - 1], split = "\\|") %>% 
  unlist() %>% 
  trimws()

# Combine the data rows into a single string, replace "|" with ",", and remove spaces
comma_separated_values = 
  raw_file[(L + 1):length(raw_file)] %>% 
  paste(collapse = "\n") %>%
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

# Combine variable names and data into a vector
raw_file_2 = 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)

# Specify the file name for the CSV file
csv_file = "raw_file.csv"

# Write the combined data with variable names to a CSV file
cat(raw_file_2, sep = "\n", file = csv_file)

# Print a message indicating the file has been written
cat("Data with variable names has been saved to", csv_file, "\n")
