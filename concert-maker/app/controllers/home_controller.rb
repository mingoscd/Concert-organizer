class HomeController < ApplicationController
	def index
		@concerts_today = Concert.where("date =?", Date.today)
		to = Date.civil(Date.today.year, Date.today.month, -1)
		@concerts_later = Concert.where(:date => Date.tomorrow .. to)
		@concerts_trending = @concerts_later.sort_by {|concert| -concert.comments.size }
	end
end
