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
		def get_combos(array)
			n = array.length - 1
			final_array = []
			while n > 0
				final_array += array.combination(n).to_a
				n -= 1
			end
			final_array
		end

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
			@movie_fit = array_of_arrays[index_of_winner]
		end

		def get_movie_fit(special)
			@recom = special.select {|movie| movie.minutes < @user.flight.minutes }
			add_array(get_combos(@recom))
		end


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
		get_movie_fit(special)

	elsif @user.aaction == true && @user.comedy == true && @user.romance == nil
		special = actions - romances & comedies
		get_movie_fit(special)

	elsif @user.aaction == nil && @user.comedy == true && @user.romance == true
		special = comedies - actions & romances
		get_movie_fit(special)

	elsif @user.aaction == true && @user.comedy == nil && @user.romance == true
		special = actions - comedies & romances
		get_movie_fit(special)

	elsif @user.aaction == true && @user.comedy == nil && @user.romance == nil
		special = actions - comedies - romances
		get_movie_fit(special)

	elsif @user.aaction == nil && @user.comedy == true && @user.romance == nil
		special = comedies - actions - romances
		get_movie_fit(special)

	elsif @user.aaction == nil && @user.comedy == nil && @user.romance == true
		special = romances - actions - comedies
		get_movie_fit(special)
	end

	@flight = @user.flight
	render 'new'
end

  private

    def user_params
      params.require(:user).permit(:flight_id)
    end


end
