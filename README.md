## Documentation for Analysis Code
# Introduction
 The analysis code consists of a single script, run_analysis.R, also in this repository. This code forms various text files representing data obtained by the accelerometer and gyroscope of a Samsung  Galaxy S smartphone as carried by 30 subjects as they performed six activities into a single data frame and then subsets it to isolate the means of the recorded means and standard deviations for each subject-activity combination. It should be run from the directory containing the UCI HAR Dataset directory once that has been downloaded.

# Packages
First we install and load in the gdata and dplyr packages if they are not already present.

# Reading in Data
The next section reads in the 'test' and 'train' portions of the dataset along with the suitable Activity and Subject information and column labels. Everything is then concatenated into a single data frame, mergetest.

# Subsetting
The next section uses matchcols to parse the column names of mergetest in order to reduce the data set to only those columns containing means and standard deviations. Some columns contain the string 'mean' but are actually mean-frequency data; these are excluded in a second step. The reduced dataset has 66 data columns, plus Subject and Activity.

# Factor Formatting
Next, the Subject and Activity columns which are of integer type must be cast into numeric form prior to being transformed to factors using 'cut'. The labels of the factor levels are changed at the same time, so the activities are better described.

# Calculating Means by Group
Using 'aggregate', the mean and std measurements making up the first 66 columns of the data frame are grouped by the Subject and Activity factors and the means of each column taken within each group. There are 30 subjects and six activities, so the resulting data frame has 180 rows of data. The Subject and Activity columns have been renamed 'Group.1' and 'Group.2' by aggregate and must be renamed.

# Output
Finally, the resulting data frame is written to 'tidymeans.txt' in the current directory. Use header=TRUE when pulling back into R with read.table. For variable information, see codebook.md, also in this repository.
