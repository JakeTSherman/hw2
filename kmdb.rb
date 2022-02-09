# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

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
Movie.destroy_all
Person.destroy_all
Character.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# -- Models created and migrated 

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

begins = Movie.new
begins.title = "Batman Begins"
begins.year = 2005
begins.rating = "PG-13"
begins.director = "Christopher Nolan"
begins.save

tdk = Movie.new
tdk.title = "The Dark Knight"
tdk.year = 2008
tdk.rating = "PG-13"
tdk.director = "Christopher Nolan"
tdk.save 

tdkr = Movie.new
tdkr.title = "The Dark Knight Rises"
tdkr.year = 2012
tdkr.rating = "PG-13"
tdkr.director = "Christopher Nolan"
tdkr.save 

#puts Movie.all.count

bale = Person.new
bale.name = "Christian Bale"
bale.save

caine = Person.new
caine.name = "Michael Caine"
caine.save

neeson = Person.new
neeson.name = "Liam Neeson"
neeson.save

holmes = Person.new
holmes.name = "Katie Holmes"
holmes.save

oldman = Person.new
oldman.name = "Gary Oldman"
oldman.save

ledger = Person.new
ledger.name = "Heath Ledger"
ledger.save

eckhart = Person.new
eckhart.name = "Aaron Eckhart"
eckhart.save

maggie = Person.new
maggie.name = "Maggie Gyllenhaal"
maggie.save

hardy = Person.new
hardy.name = "Tom Hardy"
hardy.save

joseph = Person.new
joseph.name = "Joseph Gordon-Levitt"
joseph.save

hathaway = Person.new
hathaway.name = "Anne Hathaway"
hathaway.save

bruce = Character.new
bruce.name = "Bruce Wayne"
bruce.movie_id = begins.id
bruce.person_id = bale.id
bruce.save

bruce2 = Character.new
bruce2.name = bruce.name
bruce2.movie_id = tdk.id
bruce2.person_id = bale.id
bruce2.save

bruce3 = Character.new
bruce3.name = bruce.name
bruce3.movie_id = tdkr.id
bruce3.person_id = bale.id
bruce3.save

alfred = Character.new
alfred.name = "Alfred"
alfred.movie_id = begins.id
alfred.person_id = caine.id
alfred.save

ra = Character.new
ra.name = "Ra's Al Ghul"
ra.movie_id = begins.id
ra.person_id = neeson.id
ra.save

rachel = Character.new
rachel.name = "Rachel Dawes"
rachel.movie_id = begins.id
rachel.person_id = holmes.id
rachel.save

gordon = Character.new
gordon.name = "Commissioner Gordon"
gordon.movie_id = begins.id
gordon.person_id = oldman.id
gordon.save

joker = Character.new
joker.name = "Joker"
joker.movie_id = tdk.id
joker.person_id = ledger.id
joker.save

dent = Character.new
dent.name = "Harvey Dent"
dent.movie_id = tdk.id
dent.person_id = eckhart.id
dent.save

alfred2 = Character.new
alfred2.name = alfred.name
alfred2.movie_id = tdk.id
alfred2.person_id = caine.id
alfred2.save

dawes2 = Character.new
dawes2.name = rachel.name
dawes2.movie_id = tdk.id
dawes2.person_id = maggie.id
dawes2.save

gordon2 = Character.new
gordon2.name = gordon.name
gordon2.movie_id = tdkr.id
gordon2.person_id = oldman.id
gordon2.save

bane = Character.new
bane.name = "Bane"
bane.movie_id = tdkr.id
bane.person_id = hardy.id
bane.save

robin = Character.new
robin.name = "James Blake"
robin.movie_id = tdkr.id
robin.person_id = joseph.id
robin.save

catwoman = Character.new
catwoman.name = "Selena Kyle"
catwoman.movie_id = tdkr.id
catwoman.person_id = hathaway.id
catwoman.save

#####***** RECREATE MODEL ACTOR AND ADD ROLE TO TABLE -- DISCARD PERSON#####


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

#puts "#{begins.title} #{begins.year} #{begins.rating} #{begins.director}"
#puts "#{tdk.title} #{tdk.year} #{tdk.rating} #{tdk.director}"
#puts "#{tdkr.title} #{tdkr.year} #{tdkr.rating} #{tdkr.director}"

movies = Movie.all
for movie in movies
   puts "#{movie.title} #{movie.year} #{movie.rating} #{movie.director}"
end


# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
people = Person.all
characters = Character.all

for movie in movies
   for character in characters
      for person in people
         if character.person_id == person.id
            if character.movie_id == movie.id
            puts "#{movie.title} #{person.name} #{character.name}"
            end
         end
      end
   end
end
