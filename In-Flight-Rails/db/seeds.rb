# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# => Flight(id: integer, number: integer, minutes: integer,
# 	        origin: string, destination: string,
# 	        created_at: datetime, updated_at: datetime)


Flight.create(number: 1, minutes:  60,  origin: "San Francisco", destination: "San Diego")
Flight.create(number: 2, minutes: 120, origin: "San Francisco", destination: "Dallas")
Flight.create(number: 3, minutes: 180, origin: "San Francisco", destination: "Toledo")
Flight.create(number: 4, minutes: 240, origin: "San Francisco", destination: "Chicago")
Flight.create(number: 5, minutes: 300, origin: "San Francisco", destination: "Anchorage")
Flight.create(number: 6, minutes: 360, origin: "San Francisco", destination: "Boston")



action = Genre.create(name: "Action")
comedy = Genre.create(name: "Comedy")
romance = Genre.create(name: "Romance")

# ACTION
Movie.create(title: "Raiders of the Lost Ark", minutes: 115).genres.push(action)
Movie.create(title: "Die Hard", minutes: 131).genres.push(action)
Movie.create(title: "The Terminator", minutes: 107 ).genres.push(action)
Movie.create(title: "The Fast and the Furious", minutes: 106).genres.push(action)

# ROMANCE
Movie.create(title: "A Room with a View", minutes: 117).genres.push(romance)
Movie.create(title: "Romeo and Juliet", minutes: 138).genres.push(romance)
Movie.create(title: "Cinderella", minutes: 105).genres.push(romance)
Movie.create(title: "Titanic", minutes: 194).genres.push(romance)

# COMEDY
Movie.create(title: "The Life of Brian", minutes: 94).genres.push(comedy)
Movie.create(title: "Inside Out", minutes: 94).genres.push(comedy)
Movie.create(title: "Ted", minutes: 106).genres.push(comedy)
Movie.create(title: "Minions", minutes: 91).genres.push(comedy)

# ACTION ROMANCE
Movie.create(title: "Troy", minutes: 163).genres.push(action, romance)
Movie.create(title: "Top Gun", minutes: 110).genres.push(action, romance)
Movie.create(title: "The Last of the Mohicans", minutes: 112).genres.push(action, romance)
Movie.create(title: "Pompeii", minutes: 105).genres.push(action, romance)

# ACTION COMEDY
Movie.create(title: "Kung Fu Hustle", minutes: 99).genres.push(action, comedy)
Movie.create(title: "Rush Hour", minutes: 98).genres.push(action, comedy)
Movie.create(title: "Hot Fuzz", minutes: 121).genres.push(action, comedy)
Movie.create(title: "Beverly Hills Cop", minutes: 105).genres.push(action, comedy)
	
# ROMANCE COMEDY
Movie.create(title: "When Harry Met Sally", minutes: 96).genres.push(romance, comedy)
Movie.create(title: "Notting Hill", minutes: 124).genres.push(romance, comedy)
Movie.create(title: "10 Things I Hate about You", minutes: 97).genres.push(romance, comedy)
Movie.create(title: "Harold and Maude", minutes: 91).genres.push(romance, comedy)

# COMEDY ROMANCE ACTION
Movie.create(title: "The Princess Bride", minutes: 98).genres.push(romance, comedy, action)
Movie.create(title: "True Lies", minutes: 141).genres.push(romance, comedy, action)
Movie.create(title: "Scott Pilgrim vs. the World", minutes: 112).genres.push(romance, comedy, action)
Movie.create(title: "Romancing the Stone", minutes: 106).genres.push(romance, comedy, action)








