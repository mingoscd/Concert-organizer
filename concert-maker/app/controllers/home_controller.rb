class HomeController < ApplicationController
	def index
		@concerts_today = Concert.where("date =?", Date.today)
		to = Date.civil(Date.today.year, Date.today.month, -1)
		@concerts_later = Concert.where(:date => Date.tomorrow .. to)
	end
end
