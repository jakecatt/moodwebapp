class MoodsController < ApplicationController

before_action :authenticate_user!

	def index
		@all_moods_average = find_ratings
		@mood = Mood.find( params[:id] )
	end

	def show
		# Day
	end

	def edit
		@mood = Mood.current_user
	end

	def create
		@mood = Mood.new
		if @mood.save
			redirect_to @mood
		end
	end

	def update
		@mood = Mood.current_user
		if @mood.update
			redirect_to @mood
		end
	end
end