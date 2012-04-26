class CommentsController < ApplicationController
  	def new
  	end	
	def create	
		@comment = current_user.comments.build(params[:comments])	
		@comment.save
		redirect_to(article_path(@comment.article_id))
	end
end
