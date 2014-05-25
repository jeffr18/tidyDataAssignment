## Readme 

## Scripts

The script "run_analysis.R" performs the following data processing:
* imports all the raw data files (see below),
* merges the data into a single data frame (see below),
* issolates the mean and standard deviation columns (see below),
* cleans up the column variable names (see below),
* outputs a tidy data file called "tidy_data.txt"

## Raw Data Files

The raw data files used are:
* features.txt - Contains the raw column titles for the main training/testing data
* activity_labels.txt - Contains the human readable activity name for y_test/train data
* X_train.txt - Contains the raw training data
* y_train.txt - Contains the activity ID for each record in the X_train.txt file
* subject_train.txt - Contains the subject ID for each record in the X_train.txt file
* X_test.txt - Contains the raw testing data
* y_test.txt - Contains the activity ID for each record in the X_test.txt file
* subject_test.txt - Contains the subject ID for each record in the X_test.txt file

## Isolated Column Variables

The mean and standard deviation columns were issolated by searching for the text "mean()" and "std()" 
in the column variable names

## Column Variable Names

Notes: the underscore "_" is used to make the column variables easier to read.
The column variable names were renamed using the following convention:
* parenthesis "()" were removed
* the prefix "t" was replaced with "time_"
* the prefix "f" was replaced with "freq_"
* dashes "-" were replaced with underscores "_"
* commas "," were replaced with underscores "_"
* 



The CodeBook.md file 

Explain which variables I picked for the mean and standard deviation and why I picked them

