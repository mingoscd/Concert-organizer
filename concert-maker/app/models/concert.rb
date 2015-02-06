class Concert < ActiveRecord::Base
	validates :band, :city, :venue, presence: true
	validate :date_valid
	validates :price, presence: true, numericality: true

	private

	def date_valid
		if date.nil?
			errors.add(:date, "is missing")
		else
			if date < Date.today 
				errors.add(:date, "is invalid")
			end
		end
	end
end
