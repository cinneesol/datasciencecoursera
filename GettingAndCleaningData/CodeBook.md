# Smartphone Data Codebook
## Data Source
Original data for project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

> _*NOTE:
> This code book references the zipped data as at 19 June 2015 *_

## Relevant files
### Description of original data
```
\---UCI HAR Dataset
    |   activity_labels.txt
    |   features.txt
    |   features_info.txt
    |   README.txt
```

### Data files loaded
```
\---UCI HAR Dataset
    |   ...
    |
    +---test
    |   |   subject_test.txt
    |   |   X_test.txt
    |   |   y_test.txt
    |   |
    |
    \---train
        |   subject_train.txt
        |   X_train.txt
        |   y_train.txt

```
#### File specifics - use as reference for original data
* _subject\_xxx.txt_: The subject for the train and test sets. A numeric vector containing the subject ID.
* _X\_xxx.txt_: The feature matrix for the train and test sets. A numeric matrix with each feature column name as described in _features.txt_. More detailed information is available in _features\_info.txt_
* _y\_xxx.txt_: The activity vector. A numeric vector with mapping defined in _activity\_labels.txt_


## Operations performed
Please refer to _run\_analysis.R_ for below. 
I. Load labels and features
 1. Load activity\_labels.txt into the _labels_ dataframe.
 2. Load features.txt into the _featuresNames_ dataframe.
>NOTE:
>There are some duplicate names in the feature set. Rename:

| INDEX|FEATURE                          |UNIQUEFEATURE                      |
|-----:|:--------------------------------|:----------------------------------|
|   317|fBodyAcc-bandsEnergy()-1,8       |fBodyAcc-bandsEnergy()-1,8.1       |
|   318|fBodyAcc-bandsEnergy()-9,16      |fBodyAcc-bandsEnergy()-9,16.1      |
|   319|fBodyAcc-bandsEnergy()-17,24     |fBodyAcc-bandsEnergy()-17,24.1     |
|   320|fBodyAcc-bandsEnergy()-25,32     |fBodyAcc-bandsEnergy()-25,32.1     |
|   321|fBodyAcc-bandsEnergy()-33,40     |fBodyAcc-bandsEnergy()-33,40.1     |
|   322|fBodyAcc-bandsEnergy()-41,48     |fBodyAcc-bandsEnergy()-41,48.1     |
|   323|fBodyAcc-bandsEnergy()-49,56     |fBodyAcc-bandsEnergy()-49,56.1     |
|   324|fBodyAcc-bandsEnergy()-57,64     |fBodyAcc-bandsEnergy()-57,64.1     |
|   325|fBodyAcc-bandsEnergy()-1,16      |fBodyAcc-bandsEnergy()-1,16.1      |
|   326|fBodyAcc-bandsEnergy()-17,32     |fBodyAcc-bandsEnergy()-17,32.1     |
|   327|fBodyAcc-bandsEnergy()-33,48     |fBodyAcc-bandsEnergy()-33,48.1     |
|   328|fBodyAcc-bandsEnergy()-49,64     |fBodyAcc-bandsEnergy()-49,64.1     |
|   329|fBodyAcc-bandsEnergy()-1,24      |fBodyAcc-bandsEnergy()-1,24.1      |
|   330|fBodyAcc-bandsEnergy()-25,48     |fBodyAcc-bandsEnergy()-25,48.1     |
|   331|fBodyAcc-bandsEnergy()-1,8       |fBodyAcc-bandsEnergy()-1,8.2       |
|   332|fBodyAcc-bandsEnergy()-9,16      |fBodyAcc-bandsEnergy()-9,16.2      |
|   333|fBodyAcc-bandsEnergy()-17,24     |fBodyAcc-bandsEnergy()-17,24.2     |
|   334|fBodyAcc-bandsEnergy()-25,32     |fBodyAcc-bandsEnergy()-25,32.2     |
|   335|fBodyAcc-bandsEnergy()-33,40     |fBodyAcc-bandsEnergy()-33,40.2     |
|   336|fBodyAcc-bandsEnergy()-41,48     |fBodyAcc-bandsEnergy()-41,48.2     |
|   337|fBodyAcc-bandsEnergy()-49,56     |fBodyAcc-bandsEnergy()-49,56.2     |
|   338|fBodyAcc-bandsEnergy()-57,64     |fBodyAcc-bandsEnergy()-57,64.2     |
|   339|fBodyAcc-bandsEnergy()-1,16      |fBodyAcc-bandsEnergy()-1,16.2      |
|   340|fBodyAcc-bandsEnergy()-17,32     |fBodyAcc-bandsEnergy()-17,32.2     |
|   341|fBodyAcc-bandsEnergy()-33,48     |fBodyAcc-bandsEnergy()-33,48.2     |
|   342|fBodyAcc-bandsEnergy()-49,64     |fBodyAcc-bandsEnergy()-49,64.2     |
|   343|fBodyAcc-bandsEnergy()-1,24      |fBodyAcc-bandsEnergy()-1,24.2      |
|   344|fBodyAcc-bandsEnergy()-25,48     |fBodyAcc-bandsEnergy()-25,48.2     |
|   396|fBodyAccJerk-bandsEnergy()-1,8   |fBodyAccJerk-bandsEnergy()-1,8.1   |
|   397|fBodyAccJerk-bandsEnergy()-9,16  |fBodyAccJerk-bandsEnergy()-9,16.1  |
|   398|fBodyAccJerk-bandsEnergy()-17,24 |fBodyAccJerk-bandsEnergy()-17,24.1 |
|   399|fBodyAccJerk-bandsEnergy()-25,32 |fBodyAccJerk-bandsEnergy()-25,32.1 |
|   400|fBodyAccJerk-bandsEnergy()-33,40 |fBodyAccJerk-bandsEnergy()-33,40.1 |
|   401|fBodyAccJerk-bandsEnergy()-41,48 |fBodyAccJerk-bandsEnergy()-41,48.1 |
|   402|fBodyAccJerk-bandsEnergy()-49,56 |fBodyAccJerk-bandsEnergy()-49,56.1 |
|   403|fBodyAccJerk-bandsEnergy()-57,64 |fBodyAccJerk-bandsEnergy()-57,64.1 |
|   404|fBodyAccJerk-bandsEnergy()-1,16  |fBodyAccJerk-bandsEnergy()-1,16.1  |
|   405|fBodyAccJerk-bandsEnergy()-17,32 |fBodyAccJerk-bandsEnergy()-17,32.1 |
|   406|fBodyAccJerk-bandsEnergy()-33,48 |fBodyAccJerk-bandsEnergy()-33,48.1 |
|   407|fBodyAccJerk-bandsEnergy()-49,64 |fBodyAccJerk-bandsEnergy()-49,64.1 |
|   408|fBodyAccJerk-bandsEnergy()-1,24  |fBodyAccJerk-bandsEnergy()-1,24.1  |
|   409|fBodyAccJerk-bandsEnergy()-25,48 |fBodyAccJerk-bandsEnergy()-25,48.1 |
|   410|fBodyAccJerk-bandsEnergy()-1,8   |fBodyAccJerk-bandsEnergy()-1,8.2   |
|   411|fBodyAccJerk-bandsEnergy()-9,16  |fBodyAccJerk-bandsEnergy()-9,16.2  |
|   412|fBodyAccJerk-bandsEnergy()-17,24 |fBodyAccJerk-bandsEnergy()-17,24.2 |
|   413|fBodyAccJerk-bandsEnergy()-25,32 |fBodyAccJerk-bandsEnergy()-25,32.2 |
|   414|fBodyAccJerk-bandsEnergy()-33,40 |fBodyAccJerk-bandsEnergy()-33,40.2 |
|   415|fBodyAccJerk-bandsEnergy()-41,48 |fBodyAccJerk-bandsEnergy()-41,48.2 |
|   416|fBodyAccJerk-bandsEnergy()-49,56 |fBodyAccJerk-bandsEnergy()-49,56.2 |
|   417|fBodyAccJerk-bandsEnergy()-57,64 |fBodyAccJerk-bandsEnergy()-57,64.2 |
|   418|fBodyAccJerk-bandsEnergy()-1,16  |fBodyAccJerk-bandsEnergy()-1,16.2  |
|   419|fBodyAccJerk-bandsEnergy()-17,32 |fBodyAccJerk-bandsEnergy()-17,32.2 |
|   420|fBodyAccJerk-bandsEnergy()-33,48 |fBodyAccJerk-bandsEnergy()-33,48.2 |
|   421|fBodyAccJerk-bandsEnergy()-49,64 |fBodyAccJerk-bandsEnergy()-49,64.2 |
|   422|fBodyAccJerk-bandsEnergy()-1,24  |fBodyAccJerk-bandsEnergy()-1,24.2  |
|   423|fBodyAccJerk-bandsEnergy()-25,48 |fBodyAccJerk-bandsEnergy()-25,48.2 |
|   475|fBodyGyro-bandsEnergy()-1,8      |fBodyGyro-bandsEnergy()-1,8.1      |
|   476|fBodyGyro-bandsEnergy()-9,16     |fBodyGyro-bandsEnergy()-9,16.1     |
|   477|fBodyGyro-bandsEnergy()-17,24    |fBodyGyro-bandsEnergy()-17,24.1    |
|   478|fBodyGyro-bandsEnergy()-25,32    |fBodyGyro-bandsEnergy()-25,32.1    |
|   479|fBodyGyro-bandsEnergy()-33,40    |fBodyGyro-bandsEnergy()-33,40.1    |
|   480|fBodyGyro-bandsEnergy()-41,48    |fBodyGyro-bandsEnergy()-41,48.1    |
|   481|fBodyGyro-bandsEnergy()-49,56    |fBodyGyro-bandsEnergy()-49,56.1    |
|   482|fBodyGyro-bandsEnergy()-57,64    |fBodyGyro-bandsEnergy()-57,64.1    |
|   483|fBodyGyro-bandsEnergy()-1,16     |fBodyGyro-bandsEnergy()-1,16.1     |
|   484|fBodyGyro-bandsEnergy()-17,32    |fBodyGyro-bandsEnergy()-17,32.1    |
|   485|fBodyGyro-bandsEnergy()-33,48    |fBodyGyro-bandsEnergy()-33,48.1    |
|   486|fBodyGyro-bandsEnergy()-49,64    |fBodyGyro-bandsEnergy()-49,64.1    |
|   487|fBodyGyro-bandsEnergy()-1,24     |fBodyGyro-bandsEnergy()-1,24.1     |
|   488|fBodyGyro-bandsEnergy()-25,48    |fBodyGyro-bandsEnergy()-25,48.1    |
|   489|fBodyGyro-bandsEnergy()-1,8      |fBodyGyro-bandsEnergy()-1,8.2      |
|   490|fBodyGyro-bandsEnergy()-9,16     |fBodyGyro-bandsEnergy()-9,16.2     |
|   491|fBodyGyro-bandsEnergy()-17,24    |fBodyGyro-bandsEnergy()-17,24.2    |
|   492|fBodyGyro-bandsEnergy()-25,32    |fBodyGyro-bandsEnergy()-25,32.2    |
|   493|fBodyGyro-bandsEnergy()-33,40    |fBodyGyro-bandsEnergy()-33,40.2    |
|   494|fBodyGyro-bandsEnergy()-41,48    |fBodyGyro-bandsEnergy()-41,48.2    |
|   495|fBodyGyro-bandsEnergy()-49,56    |fBodyGyro-bandsEnergy()-49,56.2    |
|   496|fBodyGyro-bandsEnergy()-57,64    |fBodyGyro-bandsEnergy()-57,64.2    |
|   497|fBodyGyro-bandsEnergy()-1,16     |fBodyGyro-bandsEnergy()-1,16.2     |
|   498|fBodyGyro-bandsEnergy()-17,32    |fBodyGyro-bandsEnergy()-17,32.2    |
|   499|fBodyGyro-bandsEnergy()-33,48    |fBodyGyro-bandsEnergy()-33,48.2    |
|   500|fBodyGyro-bandsEnergy()-49,64    |fBodyGyro-bandsEnergy()-49,64.2    |
|   501|fBodyGyro-bandsEnergy()-1,24     |fBodyGyro-bandsEnergy()-1,24.2     |
|   502|fBodyGyro-bandsEnergy()-25,48    |fBodyGyro-bandsEnergy()-25,48.2    |

II. Load and merge the train set matrices and vectors into the _training_ dataframe
 1. Load X\_train.txt, y\_train.txt and subject\_train.txt into _trainX_, _trainY_ and _trainS_ dataframes.
 2. Set the column name in _trainY_ to ACTIVITY and the column name in _trainS_ to SUBJECT.
 3. Set the column names in _trainX_ equal to the 2nd column in __featuresNames_.
 4. Reassign _trainX_ with only the means and variances of each measurement of the original _trainX_. 
 5. Merge _trainS_, _trainY_, and the modified _trainX_ dataframes.
 6. Add a SET column with the text 'train' in each row. This is to identify the train and test sets in the merged data.

The data frame as the following structure (only partially displayed):

| SUBJECT| ACTIVITY|SET   | tBodyAcc-mean()-X| tBodyAcc-mean()-Y| tBodyAcc-mean()-Z|
|-------:|--------:|:-----|-----------------:|-----------------:|-----------------:|
|       1|        5|train |         0.2885845|        -0.0202942|        -0.1329051|
|       1|        5|train |         0.2784188|        -0.0164106|        -0.1235202|
|       1|        5|train |         0.2796531|        -0.0194672|        -0.1134617|
|       1|        5|train |         0.2791739|        -0.0262006|        -0.1232826|
|       1|        5|train |         0.2766288|        -0.0165697|        -0.1153618|
|       1|        5|train |         0.2771988|        -0.0100978|        -0.1051372|

Full list of column names:

SUBJECT,ACTIVITY and SET as above. The other fields are as defined in the original data

|COLUMNNAME                  |
|:---------------------------|
|SUBJECT                     |
|ACTIVITY                    |
|SET                         |
|tBodyAcc-mean()-X           |
|tBodyAcc-mean()-Y           |
|tBodyAcc-mean()-Z           |
|tBodyAcc-std()-X            |
|tBodyAcc-std()-Y            |
|tBodyAcc-std()-Z            |
|tGravityAcc-mean()-X        |
|tGravityAcc-mean()-Y        |
|tGravityAcc-mean()-Z        |
|tGravityAcc-std()-X         |
|tGravityAcc-std()-Y         |
|tGravityAcc-std()-Z         |
|tBodyAccJerk-mean()-X       |
|tBodyAccJerk-mean()-Y       |
|tBodyAccJerk-mean()-Z       |
|tBodyAccJerk-std()-X        |
|tBodyAccJerk-std()-Y        |
|tBodyAccJerk-std()-Z        |
|tBodyGyro-mean()-X          |
|tBodyGyro-mean()-Y          |
|tBodyGyro-mean()-Z          |
|tBodyGyro-std()-X           |
|tBodyGyro-std()-Y           |
|tBodyGyro-std()-Z           |
|tBodyGyroJerk-mean()-X      |
|tBodyGyroJerk-mean()-Y      |
|tBodyGyroJerk-mean()-Z      |
|tBodyGyroJerk-std()-X       |
|tBodyGyroJerk-std()-Y       |
|tBodyGyroJerk-std()-Z       |
|tBodyAccMag-mean()          |
|tBodyAccMag-std()           |
|tGravityAccMag-mean()       |
|tGravityAccMag-std()        |
|tBodyAccJerkMag-mean()      |
|tBodyAccJerkMag-std()       |
|tBodyGyroMag-mean()         |
|tBodyGyroMag-std()          |
|tBodyGyroJerkMag-mean()     |
|tBodyGyroJerkMag-std()      |
|fBodyAcc-mean()-X           |
|fBodyAcc-mean()-Y           |
|fBodyAcc-mean()-Z           |
|fBodyAcc-std()-X            |
|fBodyAcc-std()-Y            |
|fBodyAcc-std()-Z            |
|fBodyAccJerk-mean()-X       |
|fBodyAccJerk-mean()-Y       |
|fBodyAccJerk-mean()-Z       |
|fBodyAccJerk-std()-X        |
|fBodyAccJerk-std()-Y        |
|fBodyAccJerk-std()-Z        |
|fBodyGyro-mean()-X          |
|fBodyGyro-mean()-Y          |
|fBodyGyro-mean()-Z          |
|fBodyGyro-std()-X           |
|fBodyGyro-std()-Y           |
|fBodyGyro-std()-Z           |
|fBodyAccMag-mean()          |
|fBodyAccMag-std()           |
|fBodyBodyAccJerkMag-mean()  |
|fBodyBodyAccJerkMag-std()   |
|fBodyBodyGyroMag-mean()     |
|fBodyBodyGyroMag-std()      |
|fBodyBodyGyroJerkMag-mean() |
|fBodyBodyGyroJerkMag-std()  |

III. Load and merge the test set matrices and vectors into the _testing_ dataframe.
 1. Perform steps II.1.-II.6. for the test set.

The data frame as the following structure (only partially displayed):

| SUBJECT| ACTIVITY|SET  | tBodyAcc-mean()-X| tBodyAcc-mean()-Y| tBodyAcc-mean()-Z|
|-------:|--------:|:----|-----------------:|-----------------:|-----------------:|
|       2|        5|test |         0.2571778|        -0.0232852|        -0.0146538|
|       2|        5|test |         0.2860267|        -0.0131634|        -0.1190825|
|       2|        5|test |         0.2754848|        -0.0260504|        -0.1181517|
|       2|        5|test |         0.2702982|        -0.0326139|        -0.1175202|
|       2|        5|test |         0.2748330|        -0.0278478|        -0.1295272|
|       2|        5|test |         0.2792200|        -0.0186204|        -0.1139020|

The column names are the same as for training.

IV. Merge TEST and TRAIN dataframes into  the _data_ dataframe.
 1. The two dataframes are merged by using rbind(). 
 2. Now map the feature names to something friendlier
 
|ORIGINAL                    |CHANGED                   |
|:---------------------------|:-------------------------|
|tBodyAcc-mean()-X           |tBodyAcc.MEAN.X           |
|tBodyAcc-mean()-Y           |tBodyAcc.MEAN.Y           |
|tBodyAcc-mean()-Z           |tBodyAcc.MEAN.Z           |
|tBodyAcc-std()-X            |tBodyAcc.STD.X            |
|tBodyAcc-std()-Y            |tBodyAcc.STD.Y            |
|tBodyAcc-std()-Z            |tBodyAcc.STD.Z            |
|tGravityAcc-mean()-X        |tGravityAcc.MEAN.X        |
|tGravityAcc-mean()-Y        |tGravityAcc.MEAN.Y        |
|tGravityAcc-mean()-Z        |tGravityAcc.MEAN.Z        |
|tGravityAcc-std()-X         |tGravityAcc.STD.X         |
|tGravityAcc-std()-Y         |tGravityAcc.STD.Y         |
|tGravityAcc-std()-Z         |tGravityAcc.STD.Z         |
|tBodyAccJerk-mean()-X       |tBodyAccJerk.MEAN.X       |
|tBodyAccJerk-mean()-Y       |tBodyAccJerk.MEAN.Y       |
|tBodyAccJerk-mean()-Z       |tBodyAccJerk.MEAN.Z       |
|tBodyAccJerk-std()-X        |tBodyAccJerk.STD.X        |
|tBodyAccJerk-std()-Y        |tBodyAccJerk.STD.Y        |
|tBodyAccJerk-std()-Z        |tBodyAccJerk.STD.Z        |
|tBodyGyro-mean()-X          |tBodyGyro.MEAN.X          |
|tBodyGyro-mean()-Y          |tBodyGyro.MEAN.Y          |
|tBodyGyro-mean()-Z          |tBodyGyro.MEAN.Z          |
|tBodyGyro-std()-X           |tBodyGyro.STD.X           |
|tBodyGyro-std()-Y           |tBodyGyro.STD.Y           |
|tBodyGyro-std()-Z           |tBodyGyro.STD.Z           |
|tBodyGyroJerk-mean()-X      |tBodyGyroJerk.MEAN.X      |
|tBodyGyroJerk-mean()-Y      |tBodyGyroJerk.MEAN.Y      |
|tBodyGyroJerk-mean()-Z      |tBodyGyroJerk.MEAN.Z      |
|tBodyGyroJerk-std()-X       |tBodyGyroJerk.STD.X       |
|tBodyGyroJerk-std()-Y       |tBodyGyroJerk.STD.Y       |
|tBodyGyroJerk-std()-Z       |tBodyGyroJerk.STD.Z       |
|tBodyAccMag-mean()          |tBodyAccMag.MEAN          |
|tBodyAccMag-std()           |tBodyAccMag.STD           |
|tGravityAccMag-mean()       |tGravityAccMag.MEAN       |
|tGravityAccMag-std()        |tGravityAccMag.STD        |
|tBodyAccJerkMag-mean()      |tBodyAccJerkMag.MEAN      |
|tBodyAccJerkMag-std()       |tBodyAccJerkMag.STD       |
|tBodyGyroMag-mean()         |tBodyGyroMag.MEAN         |
|tBodyGyroMag-std()          |tBodyGyroMag.STD          |
|tBodyGyroJerkMag-mean()     |tBodyGyroJerkMag.MEAN     |
|tBodyGyroJerkMag-std()      |tBodyGyroJerkMag.STD      |
|fBodyAcc-mean()-X           |fBodyAcc.MEAN.X           |
|fBodyAcc-mean()-Y           |fBodyAcc.MEAN.Y           |
|fBodyAcc-mean()-Z           |fBodyAcc.MEAN.Z           |
|fBodyAcc-std()-X            |fBodyAcc.STD.X            |
|fBodyAcc-std()-Y            |fBodyAcc.STD.Y            |
|fBodyAcc-std()-Z            |fBodyAcc.STD.Z            |
|fBodyAccJerk-mean()-X       |fBodyAccJerk.MEAN.X       |
|fBodyAccJerk-mean()-Y       |fBodyAccJerk.MEAN.Y       |
|fBodyAccJerk-mean()-Z       |fBodyAccJerk.MEAN.Z       |
|fBodyAccJerk-std()-X        |fBodyAccJerk.STD.X        |
|fBodyAccJerk-std()-Y        |fBodyAccJerk.STD.Y        |
|fBodyAccJerk-std()-Z        |fBodyAccJerk.STD.Z        |
|fBodyGyro-mean()-X          |fBodyGyro.MEAN.X          |
|fBodyGyro-mean()-Y          |fBodyGyro.MEAN.Y          |
|fBodyGyro-mean()-Z          |fBodyGyro.MEAN.Z          |
|fBodyGyro-std()-X           |fBodyGyro.STD.X           |
|fBodyGyro-std()-Y           |fBodyGyro.STD.Y           |
|fBodyGyro-std()-Z           |fBodyGyro.STD.Z           |
|fBodyAccMag-mean()          |fBodyAccMag.MEAN          |
|fBodyAccMag-std()           |fBodyAccMag.STD           |
|fBodyBodyAccJerkMag-mean()  |fBodyBodyAccJerkMag.MEAN  |
|fBodyBodyAccJerkMag-std()   |fBodyBodyAccJerkMag.STD   |
|fBodyBodyGyroMag-mean()     |fBodyBodyGyroMag.MEAN     |
|fBodyBodyGyroMag-std()      |fBodyBodyGyroMag.STD      |
|fBodyBodyGyroJerkMag-mean() |fBodyBodyGyroJerkMag.MEAN |
|fBodyBodyGyroJerkMag-std()  |fBodyBodyGyroJerkMag.STD  |

 3. Transform the numeric information in the ACTIVITY column to a descriptive factor vector using _labels_.

The data frame as the following structure (only partially displayed):

| SUBJECT|ACTIVITY |SET   | tBodyAcc.MEAN.X| tBodyAcc.MEAN.Y| tBodyAcc.MEAN.Z|
|-------:|:--------|:-----|---------------:|---------------:|---------------:|
|       1|STANDING |train |       0.2885845|      -0.0202942|      -0.1329051|
|       1|STANDING |train |       0.2784188|      -0.0164106|      -0.1235202|
|       1|STANDING |train |       0.2796531|      -0.0194672|      -0.1134617|
|       1|STANDING |train |       0.2791739|      -0.0262006|      -0.1232826|
|       1|STANDING |train |       0.2766288|      -0.0165697|      -0.1153618|
|       1|STANDING |train |       0.2771988|      -0.0100978|      -0.1051372|

...

| SUBJECT|ACTIVITY         |SET  | tBodyAcc.MEAN.X| tBodyAcc.MEAN.Y| tBodyAcc.MEAN.Z|
|-------:|:----------------|:----|---------------:|---------------:|---------------:|
|      24|WALKING_UPSTAIRS |test |       0.1922746|      -0.0336426|      -0.1059491|
|      24|WALKING_UPSTAIRS |test |       0.3101546|      -0.0533912|      -0.0991087|
|      24|WALKING_UPSTAIRS |test |       0.3633846|      -0.0392140|      -0.1059151|
|      24|WALKING_UPSTAIRS |test |       0.3499661|       0.0300774|      -0.1157880|
|      24|WALKING_UPSTAIRS |test |       0.2375938|       0.0184669|      -0.0964989|
|      24|WALKING_UPSTAIRS |test |       0.1536272|      -0.0184365|      -0.1370185|

V. Group and summarise the data
 1. Group _data_ first by subject and then by activity.
 2. Create _dataSummary_ by taking the average (_mean()_) of each feature.

The data frame as the following structure (only partially displayed):

|ACTIVITY | SUBJECT| tBodyAcc.MEAN.X| tBodyAcc.MEAN.Y| tBodyAcc.MEAN.Z| tBodyAcc.STD.X|
|:--------|-------:|---------------:|---------------:|---------------:|--------------:|
|LAYING   |       1|       0.2215982|      -0.0405140|      -0.1132036|     -0.9280565|
|LAYING   |       2|       0.2813734|      -0.0181587|      -0.1072456|     -0.9740595|
|LAYING   |       3|       0.2755169|      -0.0189557|      -0.1013005|     -0.9827766|
|LAYING   |       4|       0.2635592|      -0.0150032|      -0.1106882|     -0.9541937|
|LAYING   |       5|       0.2783343|      -0.0183042|      -0.1079376|     -0.9659345|
|LAYING   |       6|       0.2486565|      -0.0102529|      -0.1331196|     -0.9340494|

...

|ACTIVITY         | SUBJECT| tBodyAcc.MEAN.X| tBodyAcc.MEAN.Y| tBodyAcc.MEAN.Z| tBodyAcc.STD.X|
|:----------------|-------:|---------------:|---------------:|---------------:|--------------:|
|WALKING_UPSTAIRS |      25|       0.2779954|      -0.0269864|      -0.1262104|     -0.4597756|
|WALKING_UPSTAIRS |      26|       0.2726914|      -0.0281634|      -0.1219435|     -0.1690070|
|WALKING_UPSTAIRS |      27|       0.2657703|      -0.0200953|      -0.1235304|     -0.2954395|
|WALKING_UPSTAIRS |      28|       0.2620058|      -0.0279444|      -0.1215140|     -0.2420624|
|WALKING_UPSTAIRS |      29|       0.2654231|      -0.0299465|      -0.1180006|     -0.0867716|
|WALKING_UPSTAIRS |      30|       0.2714156|      -0.0253312|      -0.1246975|     -0.3505045|

VI. Save the output
 1. Save _dataSummary_ into _FeatureSummary.txt_. Exclude row names.
