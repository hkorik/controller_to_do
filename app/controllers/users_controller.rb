class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new

	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success_message] = "User Successfully created!"
			redirect_to new_user_path
		else
			flash[:error_messages] = @user.errors.full_messages
			redirect_to new_user_path
		end
	end
end
