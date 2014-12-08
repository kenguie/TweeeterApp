class ChirpsController < ApplicationController
	before_action :set_chirp, only: [:show, :edit, :update, :destroy]

	def index
		@chirps = Chirp.all
	end

	def show
	end

	def new
		@chirp = Chirp.new
	end

	def create
		@chirp = Chirp.new(chirp_params)
		#@chirp.user = User.find(session[:user_id])
		if @chirp.save
			flash[:notice] = "New chirp!"
			redirect_to @chirp
		else
			flash[:notice] = "No chirp for you!"
			render :new
		end
	end

	def edit
	end

	def update
		if @chirp.update(chirp_params)
			flash[:notice] = "Chirp updated!"
			redirect_to @chirp
		else
			flash[:alert] = "Something went wrong."
			render :edit
		end
	end

	def destroy
		@chirp.destroy
		flash[:notice] = "Chirp deleted!"
		redirect_to users_path
	end

	private

	def chirp_params
		params.require(:chirp).permit(:body).merge(user_id: current_user.id)
	end

	def set_chirp
		@chirp = Chirp.find(params[:id])
	end
end