class Movie < ActiveRecord::Base
	has_many :assignments
	has_many :genres, through: :assignments
end
