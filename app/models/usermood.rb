class Usermood < ActiveRecord::Base

	belongs_to :user

	def self.find_ratings
		
		mood_rating_sum = 0

		Usermood.all.each do |mood|
			mood.rating
			mood_rating_sum += mood.rating
		end

		mood_count = Usermood.count

		if mood_count == 0
			mood_rating_average = 0
		else
			mood_rating_average = mood_rating_sum / mood_count 
		end

		return mood_rating_average

	end

end