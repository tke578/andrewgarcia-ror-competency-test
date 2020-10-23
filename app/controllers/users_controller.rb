class UsersController < ApplicationController
	before_action :authenticate_user!
	access admin: :all

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	 	if @user.save
	    	redirect_to users_admin_path(@user)
	  	else
	    	render 'new'
	  	end
	end

	def show
		@user = User.find(params[:id])
		redirect_to root_url, flash: { error: "User not found." } if @user.blank?
	end

	def edit
		@user = User.find(params[:id])
  		redirect_to root_url, flash: { error: "User not found." } if @user.blank?
	end

	def update
		@user = User.find(params[:id])
		redirect_to root_url, flash: { error: "User not found." } if @user.blank?
		if @user.update(user_params)
		   	redirect_to users_admin_path(@user)
		else
		    render 'edit'
		end
	end

	def destroy
		@user = User.find_by(id: params[:id])
		redirect_to root_url, flash: { error: "User not found." } if @user.blank?

  		@user.destroy
  		redirect_to users_admin_path(@user)
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :roles)
	end
end