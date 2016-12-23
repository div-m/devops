#!/usr/bin/python
import boto3
import sys
import botocore
bucket_action = sys.argv[1]
bucket_name = sys.argv[2]
s3_client = boto3.client('s3')
if bucket_action == 'create_bucket' :
  print " ---Bucket is getting created---"
  s3_client.create_bucket(Bucket=bucket_name)
s3_resource = boto3.resource('s3')
if bucket_action == 'delete_bucket' :
  print " ---Bucket is getting deleted---"
  try:
     bucket=s3_resource.Bucket(bucket_name)
     for key in bucket.objects.all() :
         key.delete()
     bucket.delete()
   except botocore.exceptions.ClientError as e :
     print e.response['Error']['code']
if bucket_action == 'upload_object' :
   print "---Object is getting uploaded---"
   s3_resource.Object(bucket_name,"welcome.txt").put(Body=open('/tmp/welcome.txt','r'))