#!/bin/bash
# This Script will create S3 bucket and tag the bucket with appropriate name.
 

# read command will prompt you to enter the name of bucket name you wish to create 
 
 
read -r -p  "Enter the name of the bucket:" bucketname
 
# Creating first function to create a bucket 
 
createbucket () {
    aws s3 mb s3://$bucketname
}
 
# Creating Second function to tag a bucket 
 
tagbucket () {
    aws s3api  put-bucket-tagging --bucket $bucketname --tagging 'TagSet=[{Key=Name,Value="'$bucketname'"}]'
}
 
# echo command will print on the screen 
 
echo "Creating the AWS S3 bucket and Tagging it !! "
createbucket    # Calling the createbucket function  
tagbucket       # calling our tagbucket function
echo "AWS S3 bucket $bucketname created successfully"
echo "AWS S3 bucket $bucketname tagged successfully "