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


Flight.create(number: 123, minutes: 180, origin: "Chicago", destination: "Oahu")
Flight.create(number: 345, minutes: 500, origin: "Vancouver", destination: "Reno")
Flight.create(number: 678, minutes: 250, origin: "Omaha", destination: "Boston")
Flight.create(number: 910, minutes: 300, origin: "Anchorage", destination: "Philadelphia")



action = Genre.create(name: "Action")
comedy = Genre.create(name: "Comedy")
romance = Genre.create(name: "Romance")


raiders = Movie.create(title: "Raiders of the Lost Ark")
view = Movie.create(title: "A Room with a View")
brian = Movie.create(title: "The Life of Brian")
romancing = Movie.create(title: "Romancing the Stone")
spies = Movie.create(title: "Spies Like Us")
mary = Movie.create(title: "There's Something About Mary")
lies = Movie.create(title: "True Lies")


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







