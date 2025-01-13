#contains some code I copied from the API tutorial for Kinesis found at https://docs.aws.amazon.com/kinesis/latest/APIReference/API_Operations.html
#used to build an initial understanding of boto3 functions for Kinesis
import boto3
import json

# def put_record(name, data, partition_key):
#         """
#         Puts data into the stream. The data is formatted as JSON before it is passed
#         to the stream.

#         :param data: The data to put in the stream.
#         :param partition_key: The partition key to use for the data.
#         :return: Metadata about the record, including its shard ID and sequence number.
#         """
#         response = client.put_record(
#             StreamName=name, Data=json.dumps(data), PartitionKey=partition_key
#             )
#         logger.info("Put record in stream %s.", name)
 
#         return response


# def describe(name):
#         """
#         Gets metadata about a stream.

#         :param name: The name of the stream.
#         :return: Metadata about the stream.
#         """
#         response = client.describe_stream(StreamName=name)
#         name = name
#         details = response["StreamDescription"]
#         logger.info("Got stream %s.", name)

#         return details
        
def main():
    client = boto3.client('kinesis')
    name = "Test-Stream"
    data = "This is a test"
    partition_key = '1'
    response1 = client.put_record(
            StreamName=name, Data=json.dumps(data), PartitionKey=partition_key
            )
    response2 = client.describe_stream(StreamName=name)
    details = response2["StreamDescription"]
    print(details)
    
if __name__ == '__main__':
    main()
