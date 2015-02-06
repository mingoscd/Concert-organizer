class ConcertsController < ApplicationController
	def index
		@concerts = Concert.all
	end

	def show
		@concert = Concert.find params[:id]
	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new concert_params
		if @concert.save
			flash[:notice] = "Concert created successfully"
			redirect_to action: 'index'
		else
			@errors_msgs = ""
			@concert.errors.full_messages.each do |error_msg|
				@errors_msgs << error_msg + "<br>"
			end
			flash[:alert] = @error_msgs
			render 'new'
		end
	end

	def edit
		@concert = Concert.find params[:id]
	end

	def update
		@concert = Concert.find params[:id]
		if @concert.update_attributes concert_params
			flash[:notice] = "Concert updated successfully"
			redirect_to action: 'index'
		else
			@errors_msgs = ""
			@concert.errors.full_messages.each do |error_msg|
				@errors_msgs << error_msg + "<br>"
			end
			flash[:alert] = @error_msgs
			render 'edit'
		end
	end

	def destroy
		Concert.find(params[:id]).destroy
		flash[:notice] = "Concert deleted successfully"
		redirect_to action: 'index'
	end

	private

	def concert_params
		params.require(:concert).permit(:band, :city, :venue, :date, :price, :description)
	end
end
