DESCRIPTION: 

An exploratory project investigating possible use cases of AWS Kinesis. kinesis_demo.py 
  was created as a personal-made tutorial/lab for Kinesis which implements CRUD operations.
  Then I designed a web app to demonstrate a potential use case. This web app accepts user jokes, which are
  read by a Kinesis stream and then processed by a Lambda function which stores the jokes in a DynamoDB
  table. The /view route uses this table so that the jokes obtained from the Kinesis stream can be displayed.

TECHNOLOGIES: 

AWS Kinesis for storing information from the web app, Flask for web app hosting,
  AWS Lambda for data processing information from Kinesis, and AWS DynamoDB for long-term data storage.

Credit: 

test.py contains code from the API references for Kinesis which was used to build an initial
  understanding of Kinesis.

https://docs.aws.amazon.com/kinesis/latest/APIReference/API_Operations.html
