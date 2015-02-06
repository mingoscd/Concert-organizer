class CommentsController < ApplicationController
	def create
		p "="*50
		p "="*50
		p params
		p "="*50
		p "="*50
		@concert = Concert.find params[:concert_id]
		@concert.comments.create comment_params
		redirect_to concert_path(@concert)
	end

	private

	def comment_params
		params.require(:comment).permit(:name, :text)
	end
end
