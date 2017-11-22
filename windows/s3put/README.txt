Sample Usage
python app.py -b python-s3-demo -f python.png -t image/png


AWS Credentials
You must create a file named "aws.txt" that contains your IAM user's key
pair in the following format.

[default]
aws_access_key_id=AKIABCDEFGHIJKLMNOPQ
aws_secret_access_key=MnOpQrStUvWxYzAbCdEfGhIjKlMnOpQrStUvWxYz


AWS S3 Bucket Policy
You must create an S3 bucket and allow your IAM user access to that bucket. 
The sample policy shown below provides unrestricted access to an S3 bucket 
named "python-s3-demo".

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "0",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "s3:HeadBucket",
                "s3:ListObjects"
            ],
            "Resource": "*"
        },
        {
            "Sid": "1",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::python-s3-demo",
                "arn:aws:s3:::python-s3-demo/*"
            ]
        }
    ]
}