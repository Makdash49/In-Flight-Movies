class UsersController < ApplicationController

	def new
		@user = User.new
		@flights = Flight.all
	end

	def create
		@user = User.create(user_params)
		@flights = Flight.all
		@flight = Flight.where(number: @user.flight).first
		render 'new'
	end


def update
	p "*" * 100
	p params
	@user = User.find(params[:id])
	@flights = Flight.all

	@user.flight = params[:user][:flight]
	@user.aaction = params[:aaction]
	@user.romance = params[:romance]
	@user.comedy = params[:comedy]
	@user.save

	actions = Genre.find(1).movies
	comedies = Genre.find(2).movies
	romances = Genre.find(3).movies

	p "&" * 100
	p @user.aaction
	p @user.romance
	p @user.comedy

	if @user.aaction == true && @user.comedy == true && @user.romance == true
		@common = actions & comedies & romances
	elsif @user.aaction == true && @user.comedy == true && @user.romance == nil
		@common = actions & comedies
	elsif @user.aaction == nil && @user.comedy == true && @user.romance == true
		@common = comedies & romances
	elsif @user.aaction == true && @user.comedy == nil && @user.romance == true
		@common = actions & romances
	elsif @user.aaction == true && @user.comedy == nil && @user.romance == nil
		@common = actions
	elsif @user.aaction == nil && @user.comedy == true && @user.romance == nil
		@common = comedies
	elsif @user.aaction == nil && @user.comedy == nil && @user.romance == true
		@common = romances
	end

	@flight = Flight.where(number: @user.flight).first
	render 'new'
end

  private

    def user_params
      params.require(:user).permit(:flight)
    end


end
