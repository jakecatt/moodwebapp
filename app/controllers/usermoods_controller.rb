class UsermoodsController < ApplicationController

before_action :authenticate_user!

before_filter :require_permission, only: [:show, :edit, :update]

	def require_permission
		if current_user != Usermood.find( params[:id] ).user
			redirect_to new_user_session_path
		end
	end

	def index
		if current_user.usermoods.empty?
			redirect_to new_usermood_path
		else
		@all_moods_average = Usermood.find_ratings
		@mood = current_user.usermoods.last.rating
	end

	def show
			@mood = Usermood.find( params[:id] )
		end
	end

	def edit
		@mood = Usermood.find( params[:id] )
	end

	def new
		@mood = Usermood.new
	end

	def create
		@mood = Usermood.new( usermood_params )
		@mood.user_id = current_user.id
		if @mood.save
			redirect_to @mood
		end
	end

	def update
		@mood = Usermood.find( params[:id] )
		if @mood.update( usermood_params )
			redirect_to @mood
		end
	end

	private

	def usermood_params
		params.require( :usermood ).permit( :rating, :message )
	end
end