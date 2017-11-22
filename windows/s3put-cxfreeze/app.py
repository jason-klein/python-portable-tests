import argparse
import boto3
import botocore
import datetime
import os

# Explicit Import Required by pyInstaller
import configparser

parser = argparse.ArgumentParser()
parser.add_argument('-b', '--Bucket', help='Name of Existing Bucket', required=True)
parser.add_argument('-f', '--File', help='Name of Local File', required=True)
parser.add_argument('-t', '--Type', help='Content Type of Local File (e.g. text/html or image/jpg)', required=True)
args = parser.parse_args()

my_bucket_name = args.Bucket
my_file_name = args.File
my_content_type = args.Type

print("Uploading '{}' to '{}'".format(my_file_name, my_bucket_name))

os.environ["AWS_SHARED_CREDENTIALS_FILE"] = 'aws.txt'
s3 = boto3.resource('s3')
bucket = s3.Bucket(my_bucket_name)

s3.Object(my_bucket_name, my_file_name).put(
        Body=open(my_file_name, 'rb'), 
        ACL='public-read', 
        ContentType=my_content_type)

s3Client = boto3.client('s3')
import boto3.session

session = boto3.session.Session()
# session = boto3.session.Session(region_name='us-west-1')
s3Client = session.client('s3')

url = s3Client.generate_presigned_url(
        'get_object', 
        Params={'Bucket': my_bucket_name, 'Key': my_file_name},
        ExpiresIn=100)
url = url.split('?')[0]

print("\nContents of {}".format(my_bucket_name))
format_string = "\t{:30} {:26}  {}"
print(format_string.format('Item', 'Last Modified', 'Owner'))
for bucket in s3.buckets.all():
    # print(bucket.name)
    if bucket.name == my_bucket_name:
        for item in bucket.objects.all():
            print(format_string.format(item.key, str(item.last_modified), item.owner['DisplayName']))

print('\nYour new file: ' + url)
