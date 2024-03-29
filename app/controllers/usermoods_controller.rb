class UsermoodsController < ApplicationController


	def index
		if current_user.usermoods.empty?
			redirect_to new_usermood_path
		else
			@all_moods_average = Usermood.find_ratings
			@mood = current_user.usermoods.first.rating
		end
	end

	def show
		@mood = Usermood.find( current_user.id )
	end

	def edit
		@mood = Usermood.find( current_user.id )
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
		@mood = Usermood.find( current_user.id )
		if @mood.update( usermood_params )
			redirect_to @mood
		end
	end

	private

	def usermood_params
		params.require( :usermood ).permit( :rating, :message )
	end
end