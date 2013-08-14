class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
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

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success_message] = "User Successfully updated!"
			redirect_to edit_user_path
		else
			flash[:error_messages] = @user.errors.full_messages
			redirect_to edit_user_path
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy
		redirect_to users_path
	end
end
