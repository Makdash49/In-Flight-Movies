class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		@flight = Flight.where(number: @user.flight).first
		render 'new'
	end


def update
	@user = User.find(params[:id])
	@user.update_attributes(flight: params[:user][:flight] )
	@flight = Flight.where(number: @user.flight).first
	render 'new'
end

  private

    def user_params
      params.require(:user).permit(:flight)
    end


end
