class UserMood < ActiveRecord::Base

	belongs_to :user

	def self.find_ratings
		
		return "hello"
		# mood_rating_sum = 0

		# Mood.all.each do |mood|
		# 	mood.rating
		# 	mood_rating_sum += mood.rating
		# end

		# mood_count = Mood.count
		# mood_rating_average = mood_rating_sum / mood_count 
	
	end

end