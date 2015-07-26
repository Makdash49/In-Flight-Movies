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


Flight.create(number: 1, minutes: 60, origin: "San Francisco", destination: "San Diego")
Flight.create(number: 2, minutes: 150, origin: "San Francisco", destination: "Dallas")
Flight.create(number: 3, minutes: 200, origin: "San Francisco", destination: "Toledo")
Flight.create(number: 4, minutes: 300, origin: "San Francisco", destination: "Boston")



action = Genre.create(name: "Action")
comedy = Genre.create(name: "Comedy")
romance = Genre.create(name: "Romance")


raiders = Movie.create(title: "Raiders of the Lost Ark", minutes: 115)
view = Movie.create(title: "A Room with a View", minutes: 117)
brian = Movie.create(title: "The Life of Brian", minutes: 94)
romancing = Movie.create(title: "Romancing the Stone", minutes: 106)
spies = Movie.create(title: "Spies Like Us", minutes: 102)
mary = Movie.create(title: "There's Something About Mary", minutes: 119)
lies = Movie.create(title: "True Lies", minutes: 141)


raiders.genres << action
view.genres << romance
brian.genres << comedy

romancing.genres << action
romancing.genres << romance

spies.genres << action
spies.genres << comedy

mary.genres << romance
mary.genres << comedy

lies.genres << action
lies.genres << romance
lies.genres << comedy







