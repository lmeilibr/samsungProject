Read me
=========
This script make the Samsung data tidy in 6 steps:

[1] First, you should place the unzipped Samsung files in your work directory:

[2] The script will read the files and merge the train and test data, adding the "subject" and "activity" columns

[3] The code will filter the columns, to get only the mean and standard deviation variables, using the grep() function

[4] #Clean memory# The script will remove old data from memory

[5] After that, using the dplyr package, we group the values by subject and activity

[6] in the last step, we save our output in a txt file.

The final table should have 180 observations and 88 variables.

