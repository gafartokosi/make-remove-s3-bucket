#!/bin/bash
# This Script will delete S3 bucket.
 

# read command will prompt you to enter the name of bucket name you wish to delete 
 
 
read -r -p  "Enter the name of the bucket:" bucketname
 
# Creating function to delete a bucket 
 
deletebucket () {
    aws s3 rb s3://$bucketname --force
}
 
# If statement to check if bucket exists
# echo command will print on the screen 

if aws s3 ls "s3://$bucketname" 2>&1 | grep -q 'An error occurred'
then
    echo "bucket does not exist or permission error."
else
    echo "Deleting the AWS S3 bucket!! "
    deletebucket    # Calling the deletebucket function
    echo "AWS S3 bucket $bucketname deleted successfully"
fi