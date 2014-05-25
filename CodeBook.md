## CodeBook

## Data Fields

The following fields are what make up the tidy_data.txt file:

1) "subject_id" - The subject id for the study participant (1:30)
2) "activity_label" - The human-readable description of the activity
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
3) "data_name" - The name of the data field which was used to calculate the average
    * time_bodyAcc_mean_X           
    * time_bodyAcc_mean_Y         
    * time_bodyAcc_mean_Z          
    * time_gravityAcc_mean_X       
    * time_gravityAcc_mean_Y        
    * time_gravityAcc_mean_Z       
    * time_bodyAccJerk_mean_X       
    * time_bodyAccJerk_mean_Y       
    * time_bodyAccJerk_mean_Z      
    * time_bodyGyro_mean_X        
    * time_bodyGyro_mean_Y          
    * time_bodyGyro_mean_Z         
    * time_bodyGyroJerk_mean_X      
    * time_bodyGyroJerk_mean_Y      
    * time_bodyGyroJerk_mean_Z     
    * time_bodyAccMag_mean          
    * time_gravityAccMag_mean       
    * time_bodyAccJerkMag_mean     
    * time_bodyGyroMag_mean         
    * time_bodyGyroJerkMag_mean     
    * freq_bodyAcc_mean_X          
    * freq_bodyAcc_mean_Y           
    * freq_bodyAcc_mean_Z           
    * freq_bodyAccJerk_mean_X      
    * freq_bodyAccJerk_mean_Y       
    * freq_bodyAccJerk_mean_Z       
    * freq_bodyGyro_mean_X         
    * freq_bodyGyro_mean_Y          
    * freq_bodyGyro_mean_Z          
    * freq_bodyAccMag_mean         
    * freq_bodyBodyAccJerkMag_mean  
    * freq_bodyBodyGyroMag_mean     
    * freq_bodyBodyGyroJerkMag_mean
    * time_bodyAcc_std_X            
    * time_bodyAcc_std_Y            
    * time_bodyAcc_std_Z           
    * time_gravityAcc_std_X         
    * time_gravityAcc_std_Y         
    * time_gravityAcc_std_Z        
    * time_bodyAccJerk_std_X        
    * time_bodyAccJerk_std_Y        
    * time_bodyAccJerk_std_Z       
    * time_bodyGyro_std_X           
    * time_bodyGyro_std_Y           
    * time_bodyGyro_std_Z          
    * time_bodyGyroJerk_std_X       
    * time_bodyGyroJerk_std_Y       
    * time_bodyGyroJerk_std_Z      
    * time_bodyAccMag_std           
    * time_gravityAccMag_std        
    * time_bodyAccJerkMag_std      
    * time_bodyGyroMag_std          
    * time_bodyGyroJerkMag_std      
    * freq_bodyAcc_std_X           
    * freq_bodyAcc_std_Y            
    * freq_bodyAcc_std_Z            
    * freq_bodyAccJerk_std_X       
    * freq_bodyAccJerk_std_Y        
    * freq_bodyAccJerk_std_Z        
    * freq_bodyGyro_std_X          
    * freq_bodyGyro_std_Y           
    * freq_bodyGyro_std_Z           
    * freq_bodyAccMag_std          
    * freq_bodyBodyAccJerkMag_std   
    * freq_bodyBodyGyroMag_std      
    * freq_bodyBodyGyroJerkMag_std 
4) "average_value" - The average value calculated for the corresponding subject, activity, and data field.