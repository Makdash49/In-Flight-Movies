class UsersController < ApplicationController

	def new
		@user = User.new
		@flights = Flight.all
	end

	def create
		@user = User.create(user_params)
		@flights = Flight.all
		@flight = @user.flight
		render 'new'
	end


def update
	@user = User.find(params[:id])
	@flights = Flight.all

	@user.flight_id = params[:user][:flight_id]
	@user.aaction = params[:aaction]
	@user.romance = params[:romance]
	@user.comedy = params[:comedy]
	@user.save

	actions = Genre.find(1).movies
	comedies = Genre.find(2).movies
	romances = Genre.find(3).movies

	if @user.aaction == true && @user.comedy == true && @user.romance == true
		special = actions & comedies & romances
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }

		# @recom is an array of movies that each fit the flight time.  I need to try every
		# combination of those movies and add up the minutes and find the combination that is closest to 
		# the flight time without going over.


		@recom.each do |movie|
			p movie.title
			p movie.minutes
		end

		def get_combos(array)
			n = array.length - 1
			final_array = []
			while n > 0
				final_array += array.combination(n).to_a
				n -= 1
			end
			final_array
		end

		array = @recom
		p get_combos(array)

		def add_array(array_of_arrays)
			p array_of_arrays
			index_of_winner = nil
			top_sum = 0
			array_of_arrays.each_with_index do |array, index|
			sum = 0
				array.each do |movie|
					sum += movie.minutes
				end

				if sum > top_sum && sum < @user.flight.minutes
					top_sum = sum
					index_of_winner = index
				end
			end
			p "*" * 100
			p index_of_winner
			p top_sum
			@movie_fit = array_of_arrays[index_of_winner]
		end

		add_array(get_combos(array))













	elsif @user.aaction == true && @user.comedy == true && @user.romance == nil
		special = actions - romances & comedies
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }

	elsif @user.aaction == nil && @user.comedy == true && @user.romance == true
		special = comedies - actions & romances
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }

	elsif @user.aaction == true && @user.comedy == nil && @user.romance == true
		special = actions - comedies & romances
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }

	elsif @user.aaction == true && @user.comedy == nil && @user.romance == nil
		special = actions - comedies - romances
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }

	elsif @user.aaction == nil && @user.comedy == true && @user.romance == nil
		special = comedies - actions - romances
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }

	elsif @user.aaction == nil && @user.comedy == nil && @user.romance == true
		special = romances - actions - comedies
		@recom = special.select {|movie| movie.minutes < @user.flight.minutes }

	end

	@flight = @user.flight
	render 'new'
end

  private

    def user_params
      params.require(:user).permit(:flight_id)
    end


end
