import boto3
import json
import base64
import urllib3

def lambda_handler(event, context):
    encoded_joke = event['Records'][0]['kinesis']['data']
    decoded_joke = base64.b64decode(encoded_joke).decode("utf-8") 
    
    http = urllib3.PoolManager()
    response = http.request('GET', 'https://www.uuidgenerator.net/api/version4').data
    
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('LabProjectTwoJokes')
    table.put_item(Item={
            'JokeID': response.decode(),
            'Joke': decoded_joke
            })
    
    
    return {
        'statusCode': 200,
        'body': json.dumps('Successfully processed data from the Kinesis shard')
    }