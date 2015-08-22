# Codebook for tidy_data.txt

This data set contains the means of multiple sets of accelerometer and gyroscope measurements made for 30 subjects across 6 activities

## Subjects

The 30 subjects are individually denoted by an integer value in the second column of the dataset, named "subject"

## Activities

The activities are listed in the first column of the dataset, named "activity"
The six possible values for this columns/field are:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING          
6. LAYING   

## Measurements

Called features by the original authors, this data set contains 66 measurement variables.

The measurements or features have not been renamed from the original set.  I do not believe human readability is improved by making 60-character-long variable names, and I have been unable to locate an adequate description of the data terminology anyway. Any attempt to further elaborate the variable names would be guess work at best, not trustworthy information.

The 66 measurements carry the following titles, in order:

* tBodyAcc-mean()-X          
* tBodyAcc-mean()-Y           
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z 
* tGravityAcc-std()-X
* tGravityAcc-std()-Y 
* tGravityAcc-std()-Z 
* tBodyAccJerk-mean()-X 
* tBodyAccJerk-mean()-Y     
* tBodyAccJerk-mean()-Z     
* tBodyAccJerk-std()-X     
* tBodyAccJerk-std()-Y       
* tBodyGyro-mean()-X         
* tBodyGyro-mean()-Y       
* tBodyGyro-mean()-Z       
* tBodyGyro-std()-X     
* tBodyGyro-std()-Y     
* tBodyGyro-std()-Z      
* tBodyGyroJerk-mean()-X   
* tBodyGyroJerk-mean()-Y    
* tBodyGyroJerk-mean()-Z      
* tBodyGyroJerk-std()-X    
* tBodyGyroJerk-std()-Y    
* tBodyGyroJerk-std()-Z   
* tBodyAccMag-mean()      
* tBodyAccMag-std()       
* tGravityAccMag-mean()     
* tGravityAccMag-std()     
* tBodyAccJerkMag-mean()   
* tBodyAccJerkMag-std()     
* tBodyGyroMag-mean()      
* tBodyGyroMag-std()       
* tBodyGyroJerkMag-mean()  
* tBodyGyroJerkMag-std()   
* fBodyAcc-mean()-X       
* fBodyAcc-mean()-Y       
* fBodyAcc-mean()-Z       
* fBodyAcc-std()-X          
* fBodyAcc-std()-Y          
* fBodyAcc-std()-Z         
* fBodyAccJerk-mean()-X       
* fBodyAccJerk-mean()-Y      
* fBodyAccJerk-mean()-Z      
* fBodyAccJerk-std()-X        
* fodyAccJerk-std()-Y       
* fBodyAccJerk-std()-Z       
* fBodyGyro-mean()-X         
* fBodyGyro-mean()-Y        
* fBodyGyro-mean()-Z       
* fBodyGyro-std()-X          
* fBodyGyro-std()-Y           
* fBodyGyro-std()-Z          
* fBodyAccMag-mean()         
* fBodyAccMag-std()          
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()   
* fBodyBodyGyroMag-mean()    
* fBodyBodyGyroMag-std()     
* fBodyBodyGyroJerkMag-mean() 
* fBodyBodyGyroJerkMag-std()

## Transformations
All variables/columns that did not contains a mean or a standard deviation value were removed.  Further, mean variables that did not have a corresponding standard deviation variable were removed as well, based on my understanding of the project's instructions.  Then, all measurements for a specific subject and activity were averaged, producing a single observation for each subject/activity combination.  The set of observations was then ordered by the subject.
