Introduction
============

The goal of the excercise is to take a real world data convert to a tidy data for further explanatory analysis. This involves processes such as collecting, combining, cleaning and summarising the data.

### Raw dataset

The raw datasets contain an experimental data from 30 individuals (subjects) and six activities (walking, walking_upstairs, walking_downstairs, sitting, standing and lying). Totally, 561 variables were recorded and/or estimated. 

### Collection of the dataset

The dataset was downloaded from [UC Irvine Machine Learning Repository][1] website. 
[1]: http://archive.ics.uci.edu/ml/ "UC Irvine Machine Learning Repository"

### Cleaning the data

The parts of the data are given in separate files. Consequently, data were merged in proper order to make the uncleaned large dataset. First, the variables name were appended to the training data. The training data was then merged with the code of activities and subjects. Similar process was also performed to the test dataset. Finally, the two dataset were merged using rbind() function. Then only the mean and standard deviations of each variables were extracted. The data was then aggregated based on subjects and activities. The final tidy dataset which may be useful for exlanatory analyssis was exported.

### List of variables

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean