## Readme

Assuming the "UCI HAR Dataset" folder is present in your working directory, the run_analysis.R script performs the following tasks:
1. Reads in the contents of the following files, storing each in its won data.frame:
	* activity_labels.txt
	* features.txt
	* test\X_test.txt
	* test\Y_test.txt
	* test\subject_test.txt
	* train\X_train.txt
	* train\Y_train.txt
	* train\subject_train.txt
2. activity_labels.txt and features.txt are both converted to factors by removing the redundant index variable column present in each.
3. The integer representations of the activities in the X_test and X_train datasets are replaced by the factor names found in activity_labels.txt.
4. The test files are combined, using cbind to append the files found in subject_test.txt and Y_test.txt to X_test.txt, adding them as new columns on the right.
5. The same is done for the three equivalent train datasets.	
6. All of the measurement variables receive names via the application of the factors from features.txt.  Additional factors for subject and activity are added.
7. The newly-combined test and train data sets have a matching number of rows and a matching layout, so they are combined into a single dataset using rbind.
8. All of the original datasets are removed from the workspace to clear memory, keeping just the new combined dataset and the factor objects.
9. All variables representing a mean or a standard deviation are extracted into a new data set/data.frame using a regular expression to match column names.
10. An aggregate function is used on the new dataset to average every repeated measurement, so that there is only a single observation for each activity by each subject.  The results are sorted by subject.  This produces a wide, not narrow dataset.  A narrow dataset with one observation per combination of subject, activity, and measurement may be useful in certain cases, but I believe it to be generally less human-readable while treading dangerously close to treating variables as values.


	

	