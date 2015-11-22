This is a readme, which will go through the code step by step. Essentially the comments in the code, with more detail.

We begin with the test data which was only 30% of the total data. We took all the activities and volunteers and linked them to
each other. Then just for simplicity while getting through the data set, we linked the activity names to the activity IDs. Then
we linked the data to this big dataset. This same procedure was performed for the training data set. After having those two data
sets finalized (finTest and finTrain) we merged them into one final data set labeled finalSet. Then took out only the columns we 
were interested in (all the standard deviation and mean data). Lastly we grouped the data by volunteer and activity to find the 
mean of the data provided by volunteer and activity.

In the file there are commented sections which will allow you to write the data to a file if you would like.
