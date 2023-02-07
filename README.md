# Gossip_MVC_Sinatra
Week 5 Day 1 - Gossip app in MVC with Sinatra

Start the program using "$ shotgun -p 4567" or "$ rackup -p 4567" in the terminal.

NB: Ruby version 2.7.4 is needed for this project. (bash --login, rvm install 2.7.4, rvm use 2.7.4)

## Config.ru (rack up file)
We run the controller from here.

## Controller
It contains all the HTML routes, linking to .erb files in folder "views" :
- index (home page) => http://localhost:4567/
- new_gossip (gossip creation) => http://localhost:4567/gossips/new/
- show (gossip display) => http://localhost:4567/gossips/1/
- edit (gossip edition) => http://localhost:4567/gossips/1/edit/

## Gossip
This program allows communication with the "gossip.csv" file:
- save a new gossip in the CSV file
- fetch all gossips from the CSV file
- find a gossip using its index
- edit a gossip in the CSV file

## Views
In this folder we keep the HTML code for each page :
- index.erb => home page
- new_gossip.erb => page with form to save a new gossip
- show.erb => page of a given gossip
- edit.erb => page with form to edit a given gossip
