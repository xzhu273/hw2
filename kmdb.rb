# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!
#rails generate model studios
#rails generate model movies 
#rails generate model actors 
#rails generate model roles

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
studio_new = Studio.new
studio_new ["name"] = "Warner Bros."
studio_new.save

movie_new = Movie.new
movie_new ["title"] = "Batman Begins"
movie_new ["year_released"] = 2005
movie_new ["rated"] = "PG-13"
movie_new ["studio_id"] = studio_new["id"]
movie_new.save


movie_new2 = Movie.new
movie_new2 ["title"] = "The Dark Knight"
movie_new2 ["year_released"] = 2008
movie_new2 ["rated"] = "PG-13"
movie_new2 ["studio_id"] = studio_new["id"]
movie_new2.save

movie_new3 = Movie.new
movie_new3 ["title"] = "The Dark Knight Rises"
movie_new3 ["year_released"] = 2012
movie_new3 ["rated"] = "PG-13"
movie_new3 ["studio_id"] = studio_new["id"]
movie_new3.save

actor_new = Actor.new
actor_new ["name"] = "Christian Bale"
actor_new.save

actor_new2 = Actor.new
actor_new2 ["name"] = "Michael Caine"
actor_new2.save

actor_new3 = Actor.new
actor_new3 ["name"] = "Liam Neeson"
actor_new3.save

actor_new4 = Actor.new
actor_new4 ["name"] = "Katie Holmes"
actor_new4.save

actor_new5 = Actor.new
actor_new5 ["name"] = "Gary Oldman"
actor_new5.save

actor_new6 = Actor.new
actor_new6 ["name"] = "Heath Ledger"
actor_new6.save

actor_new7 = Actor.new
actor_new7 ["name"] = "Aaron Eckhart"
actor_new7.save

actor_new8 = Actor.new
actor_new8 ["name"] = "Maggie Gyllenhaal"
actor_new8.save

actor_new9 = Actor.new
actor_new9 ["name"] = "Tom Hardy"
actor_new9.save

actor_new10 = Actor.new
actor_new10 ["name"] = "Joseph Gordon-Levitt"
actor_new10.save

actor_new11 = Actor.new
actor_new11 ["name"] = "Anne Hathaway"
actor_new11.save

bruce_wayne_1 = Role.new
bruce_wayne_1 ["movie_id"] = movie_new ["id"]
bruce_wayne_1 ["actor_id"] = actor_new ["id"]
bruce_wayne_1 ["character_name"] = "Bruce Wayne"
bruce_wayne_1.save

alfred_1 = Role.new
alfred_1 ["movie_id"] = movie_new ["id"]
alfred_1 ["actor_id"] = actor_new2 ["id"]
alfred_1 ["character_name"] = "Alfred"
alfred_1.save

rag=Role.new
rag ["movie_id"] = movie_new ["id"]
rag ["actor_id"] = actor_new3 ["id"]
rag ["character_name"] = "Ra's Al Ghul"
rag.save

rachel_dawes = Role.new
rachel_dawes ["movie_id"] = movie_new ["id"]
rachel_dawes ["actor_id"] = actor_new4 ["id"]
rachel_dawes ["character_name"] = "Rachel Dawes"
rachel_dawes.save

commissioner_gordo = Role.new
commissioner_gordo ["movie_id"] = movie_new ["id"]
commissioner_gordo ["actor_id"] = actor_new5 ["id"]
commissioner_gordo ["character_name"] = "Commissioner Gordo"
commissioner_gordo.save

bruce_wayne_2 = Role.new
bruce_wayne_2 ["movie_id"] = movie_new2 ["id"]
bruce_wayne_2 ["actor_id"] = actor_new ["id"]
bruce_wayne_2 ["character_name"] = "Bruce Wayne"
bruce_wayne_2.save

joker = Role.new
joker ["movie_id"] = movie_new2 ["id"]
joker ["actor_id"] = actor_new6 ["id"]
joker ["character_name"] = "Joker"
joker.save

harvey_dent= Role.new
harvey_dent ["movie_id"] = movie_new2 ["id"]
harvey_dent ["actor_id"] = actor_new7 ["id"]
harvey_dent ["character_name"] = "Harvey Dent"
harvey_dent.save

alfred_2 = Role.new
alfred_2 ["movie_id"] = movie_new2 ["id"]
alfred_2 ["actor_id"] = actor_new2 ["id"]
alfred_2 ["character_name"] = "Alfred"
alfred_2.save

rachel_dawes_2 = Role.new
rachel_dawes_2 ["movie_id"] = movie_new2 ["id"]
rachel_dawes_2 ["actor_id"] = actor_new8 ["id"]
rachel_dawes_2 ["character_name"] = "Rachel Dawes"
rachel_dawes_2.save

bruce_wayne_3 = Role.new
bruce_wayne_3 ["movie_id"] = movie_new3 ["id"]
bruce_wayne_3 ["actor_id"] = actor_new ["id"]
bruce_wayne_3 ["character_name"] = "Bruce Wayne"
bruce_wayne_3.save

commissioner_gordo_2 = Role.new
commissioner_gordo_2 ["movie_id"] = movie_new3 ["id"]
commissioner_gordo_2 ["actor_id"] = actor_new5 ["id"]
commissioner_gordo_2 ["character_name"] = "Commissioner Gordo"
commissioner_gordo_2.save

bane = Role.new
bane ["movie_id"] = movie_new3 ["id"]
bane ["actor_id"] = actor_new9 ["id"]
bane ["character_name"] = "Bane"
bane.save

john_blake = Role.new
john_blake ["movie_id"] = movie_new3 ["id"]
john_blake ["actor_id"] = actor_new10 ["id"]
john_blake ["character_name"] = "John Blake"
john_blake.save

sk = Role.new
sk ["movie_id"] = movie_new3 ["id"]
sk ["actor_id"] = actor_new11 ["id"]
sk ["character_name"] = "Selina Kyle"


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movie_all = Movie.all
for movie in movie_all
    title = movie["title"]
    year_released = movie ["year_released"]
    rated = movie ["rated"]
    studio_name = movie ["studio_id"]
    warner = Studio.find_by ({"id" => studio_name})
    puts "#{title} #{year_released} #{rated} #{warner["name"]}"
end 

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
role_all = Role.all
for role in role_all
    movie_name = role ["movie_id"] 
    movie = Movie.find_by ({"id" => movie_name})
    actor_name = role ["actor_id"] 
    actor = Actor.find_by ({"id" => actor_name})
    character_name = role ["chracter_name"]


    puts "#{movie["title"]} #{actor["name"]} #{role["character_name"]} "
end