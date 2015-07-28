class UsersController < ApplicationController

	include UsersHelper

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

	@actions = Genre.find(1).movies
	@comedies = Genre.find(2).movies
	@romances = Genre.find(3).movies

	evaluate_check_boxes

	@flight = @user.flight
	render 'new'
end

  private

    def user_params
      params.require(:user).permit(:flight_id)
    end


end
