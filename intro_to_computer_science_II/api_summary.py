import requests
api_key = "Vr7qnrjDSSbYNyTztXzxz9Lf3LVL11XFIaPNqbyh"
base_url = "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/photos"
query_params = {"api_key": api_key, "earth_date": "2021-11-27"}

response = requests.get(base_url,params=query_params)
#print(response.json())

print("Total number of photos:",len(response.json()['photos']))
print(response.json()['photos'][69])