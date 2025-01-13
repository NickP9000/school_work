#demo code to demonstrate how you can create, read, update and delete shards using boto3
import boto3
from botocore.exceptions import ClientError
import json

client = boto3.client("kinesis")

#CREATE
def create(name):
    response = client.create_stream(
        StreamName=name, ShardCount=1, 
        StreamModeDetails={
        'StreamMode': 'PROVISIONED'}
        )
    return response
    
#UPDATE
def put(name, partition_key, data):
    response = client.put_record(
        StreamName=name, Data=json.dumps(data), PartitionKey=partition_key
        )
    return response
    
def get_shard_id(name):
    response = client.list_shards(StreamName=name)
    return response['Shards'][0]['ShardId']
    
#basic display function that allows one to see the oldest part of the shard.
def display_content(name):
    shard_id = get_shard_id(name)
    shard_iterator_response = client.get_shard_iterator(
        StreamName=name, ShardId=shard_id,
        ShardIteratorType='TRIM_HORIZON'
        )
    response = client.get_records(ShardIterator=shard_iterator_response['ShardIterator'])
    return response
    
#"READ" -- has some unresolved issues revolving around the way shards only hold data for 24h by default
# only works for newly created streams as then the data appears at the beginning of a shard.
def display_content_loop(name):
    shard_id = get_shard_id(name)
    response = client.get_shard_iterator(
        StreamName=name, ShardId=shard_id,
        ShardIteratorType='TRIM_HORIZON'
        )
    shard_iter = response['ShardIterator']
    
    while True:
        response = client.get_records(
            ShardIterator=shard_iter, Limit=1
            )
        if response["Records"] == []:
            break
        print(response["Records"])
        shard_iter = response["NextShardIterator"]
    return response
    
#DELETE
def delete(name):
    response = client.delete_stream(StreamName=name)
    return response
    
def main():
    name = input("Enter a new name if creating a new data stream or a name of an existing data stream to continue.\n")
   
    flag = 'b'
    while(flag != 'q'):
        try:
            if flag == 'c':
                response = create(name)
                print(response)
            elif flag == 'r': 
                display_content_loop(name)
            elif flag == 'u':
                p_key = "0"
                data_entry = input("Enter the string data to be stored in the shard:\n")
                response = put(name, p_key, data_entry)
                print(response)
            elif flag == 'd':
                caution = input("Are you sure you want to delete the stream? (y/n)\n")
                if caution.lower() == 'y':
                    response = delete(name)
                    print(response)
                else:
                    caution = ""
        except ClientError:
            print(f"No data stream found under '{name}'. Please try again.")
            
        if flag == 'i':
            name = input("Enter a new name if creating a new data stream or a name of an existing data stream to continue.\n")
        elif flag == 'q':
            print("Quitting program...")
            break
        flag = input("""
            Enter one of the following options to continue:
            C - Create the data stream
            R - Read the contents of the data stream
            U - Update data in the data stream
            D - Delete the data stream
            I - Input a new data stream name
            Q - Quit Program\n
            """)
        flag = flag.lower()
    
if __name__ == "__main__":
    main()