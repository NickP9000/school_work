import boto3
import json
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def home_page():
    return render_template("home.html", success="")
    
@app.route("/", methods = ['POST'])
def home_page_post():
    form_response = request.form['favoritejoke']
    client = boto3.client('kinesis')
    response = client.put_record(
        StreamName="JokeStream", Data=json.dumps(form_response), PartitionKey="0"
        )
    return render_template("home.html", success="Joke successfully added!")
    
@app.route("/view")
def view():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('LabProjectTwoJokes')
    response = table.scan(AttributesToGet=['Joke'])
    return render_template("view.html", items=response['Items'])
    
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)