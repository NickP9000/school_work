import boto3
import pymysql
import creds
#This file contains all the non-routing functions of Hero Hub

TABLE_NAME = "HeroUser"


def check_credentials(user, password):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(TABLE_NAME)
    #get the user profile based on the username, an incorrect username will return a dictionary with primary key ResponseMetadata
    user_profile = table.get_item(Key={"username": user})
    #try except block prevents incorrect username from causing an exception
    try:
        #return 1 if the username and password are correct
        return user_profile['Item']["password"] == password
    #return 0 if username is incorrect
    except:
        return False

def create_credentials(user, password):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(TABLE_NAME)
    #check if user already exists and return false if a user already exists under the username
    user_profile = table.get_item(Key={"username": user})
    try:
        if user_profile['Item']["password"] != "":
            return False
    #else add the user to the dynamodb and return true
    except:
        table.put_item(Item={
            'username': user,
            'password': password,
            'favoriteheroes': []
            })
        return True
  
#takes session_user to delete account
def delete_credentials(user):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(TABLE_NAME)
    
    table.delete_item(Key= {"username": user})
    
#get connection to SQL database
def get_conn():
    conn = pymysql.connect(
    host= creds.host,
    user= creds.user, 
    password = creds.password,
    db=creds.db,)
    return conn

#execute query on SQL database
def execute_query(query, args=()):
    cur = get_conn().cursor()
    cur.execute(query, args)
    rows = cur.fetchall()
    cur.close()
    return rows
   
#get heroes to display on the /browse route 
def get_heroes():
    rows = execute_query("""SELECT superhero_name, gender, race, alignment, publisher_name
    FROM superhero JOIN gender JOIN race JOIN alignment JOIN publisher
    WHERE gender_id = gender.id and race_id = race.id and gender_id = gender.id and alignment_id = alignment.id and publisher_id = publisher.id
    ORDER BY superhero_name;""")
    return rows
    
def get_favorites(username):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(TABLE_NAME)
    
    user_profile = table.get_item(Key={"username": username})
    user_favorites = user_profile['Item']['favoriteheroes']
    
    #if user_favorites is empty, return False
    if len(user_favorites) == 0:
        return False
    
    #try first query (works for len(user_favorites) > 1)
    try:
        query = f"""SELECT superhero_name, gender, race, alignment, publisher_name
        FROM superhero JOIN gender JOIN race JOIN alignment JOIN publisher
        WHERE gender_id = gender.id and race_id = race.id and gender_id = gender.id and alignment_id = alignment.id and publisher_id = publisher.id
        and (superhero_name) in {tuple(user_favorites)};"""
        rows = execute_query(query)
    #adjust query if len(user_favorites) == 1
    except:
        query = f"""SELECT superhero_name, gender, race, alignment, publisher_name
        FROM superhero JOIN gender JOIN race JOIN alignment JOIN publisher
        WHERE gender_id = gender.id and race_id = race.id and gender_id = gender.id and alignment_id = alignment.id and publisher_id = publisher.id
        and (superhero_name) in ('{user_favorites[0]}');"""
        print(query)
        rows = execute_query(query)
    return rows
    
def get_one_hero(hero_name):
    row = execute_query(f"""SELECT superhero_name, power_name, gender, race, alignment, publisher_name
    FROM superhero JOIN gender JOIN race JOIN alignment JOIN publisher JOIN superpower JOIN hero_power
    WHERE gender_id = gender.id and race_id = race.id and gender_id = gender.id and alignment_id = alignment.id 
    and publisher_id = publisher.id and hero_id = superhero.id and power_id = superpower.id and superhero_name = '{hero_name}';""")
   
    #put powers into one list
    powers = []
    for entry in row:
        powers.append(entry[1])
        
    return row, powers
    
#allows session_user to update their list of favorite heroes
def favorite_hero(username, hero_name):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(TABLE_NAME)
    
    user_profile = table.get_item(Key={"username": username})
    user_favorites = user_profile['Item']['favoriteheroes']
    
    if hero_name in user_favorites:
        return False
    else:
        user_favorites.append(hero_name)
        table.update_item(
            Key={
                'username': username
            },
            UpdateExpression='SET favoriteheroes = :val1',
            ExpressionAttributeValues={
                ':val1': user_favorites
            })
        return True
        
def remove_favorite_hero(username, hero_name):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(TABLE_NAME)
    
    user_profile = table.get_item(Key={"username": username})
    user_favorites = user_profile['Item']['favoriteheroes']
    
    print(hero_name)
    user_favorites.remove(hero_name)
    table.update_item(
            Key={
                'username': username
            },
            UpdateExpression='SET favoriteheroes = :val1',
            ExpressionAttributeValues={
                ':val1': user_favorites
            })