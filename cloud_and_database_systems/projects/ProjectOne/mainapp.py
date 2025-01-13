#Name: Nick Peters
#Class: CS-178 2:00 Section
#Citations: ChatGPT was utilized to quickly generate html documents (link: https://chat.openai.com/share/1b55fcb9-323e-425f-ab8f-75cb7511a5b6). 
#           That said, every document was edited to meet my own design criteria. Stack Overflow greatly aided in
#           various aspects of the project, though I am unable to credit specific posts.
#           Lastly, my MySQL database comes from github: https://github.com/bbrumm/databasestar/tree/main/sample_databases/sample_db_superheroes/mysql
from flask import Flask, render_template, request, redirect
from helper import *
import ast

#This file contains all the routing functions for Hero Hub
app = Flask(__name__)
session_user = ""
session_password = ""

@app.route("/")
def home_page():
    return render_template("home.html")
 
@app.route("/login", methods = ['GET'])
def login_form():
    #render the template with an invisible character so the fail html paragraph still appears but blank
    return render_template("login.html", fail="‎ ")
    
@app.route("/login", methods = ['POST'])
def login_form_post():
    user = request.form['username']
    password = request.form['password']
    
    #check that the username and password are correct
    response = check_credentials(user, password)
    
    #if repsonse is true login has succeded
    if response:
        global session_user
        session_user = user
        global session_password
        session_password = password
        return render_template("logincomplete.html", username=session_user)
    #login has failed, prompt user to check username and password and try again
    else:
        return render_template("login.html", fail="Login attempt failed. Please check your username and password and try again.")
        
@app.route("/signout")
def signout():
    #reset session_user and password, render a sign out html template
    global session_user
    session_user = ""
    global session_password
    session_password = ""
    return render_template("signout.html")

@app.route("/profile")
def profile():
    return render_template("profile.html", name=session_user)
    
@app.route("/profile/delete")
def delete_account():
    return render_template("deleteaccount.html", fail="‎ ")
    
@app.route("/profile/delete", methods = ['POST'])
def delete_account_post():
    password = request.form['confirm_password']
    confirm = request.form['confirmation']
    
    #declare here so no errors when we need to change them
    global session_user
    global session_password
    #promt user if no account is logged in
    if session_user == "":
            return render_template("deleteaccount.html", fail="No user logged in. Please log in to delete your account.")
    #successful deletion
    if confirm == "deletemyaccount" and password == session_password:
            delete_credentials(session_user)
            session_user = ""
            session_password = ""
            return render_template("deletecomplete.html")
    #password is incorrect
    else:
        return render_template("deleteaccount.html", fail="Incorrect password or confirmation. Please try again.")

@app.route("/register")
def register_form():
    #render the template with an invisible character so the fail html paragraph still appears but blank
    return render_template("register.html", fail="‎ ")
    
@app.route("/register", methods = ['POST'])
def register_form_post():
    user = request.form['username']
    password = request.form['password']
    confirm_pass = request.form['confirm-password']
    
    #reject registration if passwords are not the same
    if password != confirm_pass:
        return render_template("register.html", fail="Passwords do not match. Please try again.")
    
    response = create_credentials(user, password)
    
    #username not taken, render the registration complete screen
    if response:
        return render_template("registercomplete.html")
    #username taken, prompt user to select a different 
    else:
        return render_template("register.html", fail="Username taken. Please select a different username.")

@app.route("/browse")
def browse():
    heroes = get_heroes()
    return render_template("browse.html", items=heroes, fail="‎ ")
    
@app.route("/browse", methods = ['GET', 'POST'])
def browse_post():
    heroes = get_heroes()
     
    #prompt log in if no session_user
    if session_user == "":
        return render_template("browse.html", items=heroes, fail="Profile not found. Please log in to add heroes to your favorites list.")
   
    hero = request.form.get("selected_item")
    #prompt user if no hero is selected
    if hero == None:
        return render_template("browse.html", items=heroes, fail="No hero selected. Select a hero and try again.")
    hero = ast.literal_eval(hero)
    
    response = favorite_hero(session_user, hero[0])
    
    #if response is true, notify that the hero has been sucessfully added to the list
    if response:
        return render_template("browse.html", items=heroes, fail=f"{hero[0]} was successfully added to your favorites list!")
    else:
        return render_template("browse.html", items=heroes, fail=f"{hero[0]} is already in your favorites list. Please choose another hero and try again.")
        
@app.route("/favorites")
def favorites_list():
    #redirect user to /login if no session_user
    if session_user == "":
        return redirect("/login", code=303)
    
    favorite_heroes = get_favorites(session_user)
    
    #redirect user to home page if favorites list is empty
    if not favorite_heroes:
        return redirect("/", 303)
    return render_template("favorites.html", items=favorite_heroes, user=session_user)

@app.route("/favorites", methods=['POST'])
def favorites_list_post():
    hero = request.form.get("selected_item")
    #redirect back to favorites page if no hero is selected
    if hero == None:
        return redirect("/favorites", code=303)
    hero = ast.literal_eval(hero)
    
    remove_favorite_hero(session_user, hero[0])
    favorite_heroes = get_favorites(session_user)
    #redirect to home page if favorites list is empty
    if not favorite_heroes:
        return redirect("/", 303)
    return render_template("favorites.html", items=favorite_heroes, user=session_user)


@app.route("/<charactername>")
def character_view(charactername):
    one_hero, powers = get_one_hero(charactername)
    
    #redirect back to browse if the hero profile returns empty
    if str(one_hero) == '()':
        return redirect(location="/browse", code=302)
    
    return render_template("heroprofile.html", name=one_hero[0][0], power=powers, gender=one_hero[0][2], race=one_hero[0][3], alignment=one_hero[0][4], publisher=one_hero[0][5], fail="‎ ")
    
@app.route("/<charactername>", methods=['POST'])
def character_view_post(charactername):
    one_hero, powers = get_one_hero(charactername)
    
    #promt log in if no session_user
    if session_user == "":
        return render_template("heroprofile.html", name=one_hero[0][0], power=powers, gender=one_hero[0][2], race=one_hero[0][3], alignment=one_hero[0][4], publisher=one_hero[0][5], fail="Profile not found. Please log in to add heroes to your favorites list.")
    
    response = favorite_hero(session_user, one_hero[0][0])
    
    #prompt user that the hero was successfully added to favorites list
    if response:
        return render_template("heroprofile.html", name=one_hero[0][0], power=powers, gender=one_hero[0][2], race=one_hero[0][3], alignment=one_hero[0][4], publisher=one_hero[0][5], fail=f"{one_hero[0][0]} was successfully added to your favorites list!")
    #prompt user that the hero is already in the favorites list
    else:
        return render_template("heroprofile.html", name=one_hero[0][0], power=powers, gender=one_hero[0][2], race=one_hero[0][3], alignment=one_hero[0][4], publisher=one_hero[0][5], fail=f"{one_hero[0][0]} is already in your favorites list. Please choose another hero and try again.")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)