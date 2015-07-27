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
		@first_recom = special.select {|movie| movie.minutes < @user.flight.minutes }

	elsif @user.aaction == true && @user.comedy == true && @user.romance == nil
		@first_recom = actions - romances & comedies
	elsif @user.aaction == nil && @user.comedy == true && @user.romance == true
		@first_recom = comedies - actions & romances
	elsif @user.aaction == true && @user.comedy == nil && @user.romance == true
		@first_recom = actions - comedies & romances
	elsif @user.aaction == true && @user.comedy == nil && @user.romance == nil
		@first_recom = actions - comedies - romances
	elsif @user.aaction == nil && @user.comedy == true && @user.romance == nil
		@first_recom = comedies - actions - romances
	elsif @user.aaction == nil && @user.comedy == nil && @user.romance == true
		@first_recom = romances - actions - comedies
	end

	@flight = @user.flight
	render 'new'
end

  private

    def user_params
      params.require(:user).permit(:flight_id)
    end


end
