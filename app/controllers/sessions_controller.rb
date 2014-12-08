class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user and @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:notice] = "Logged in!"
			redirect_to users_path
		else
			flash[:alert] = "There was a problem logging you in."
			redirect_to new_session_path
		end
	end

	def destroy
		@user = User.find(session[:user_id])
		session[:user_id] = nil
		redirect_to @user
	end

end