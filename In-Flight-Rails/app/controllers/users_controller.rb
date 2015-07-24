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
	@user.drama = params[:drama]
	@user.romance = params[:romance]
	@user.comedy = params[:comedy]
	@user.save

	@flight = Flight.where(number: @user.flight).first
	render 'new'
end

  private

    def user_params
      params.require(:user).permit(:flight)
    end


end
