class VoteCommentsController < ApplicationController
	def de_vote
		if signed_in? 
		voted_comment = params[:voted_comment]
		@new_vote = VoteComment.where({ :comment_id => voted_comment,
										:user_id => current_user.id})
		@new_vote.vote_type_id = 3
			if @new_vote.save
			 	@new_vote.comment.de_voted
			 	@new_vote.comment.save
				

			end	
			redirect_to article_path(@new_vote.comment.article_id)
		end
	end
	def up
		if signed_in? 
		voted_comment = params[:voted_comment]
		@new_vote = current_user.vote_comments.build({ 	:user_id => current_user.id, 
														:comment_id => voted_comment, 
														:vote_type_id => 1 })
			if @new_vote.save
			 	@new_vote.comment.voted_up
			 	@new_vote.comment.save
				

			end	
			redirect_to article_path(@new_vote.comment.article_id)
		end
	end
	def down
		if signed_in? 
		voted_comment = params[:voted_comment]
		@new_vote = current_user.vote_comments.build({ 	:user_id => current_user.id, 
														:comment_id => voted_comment, 
														:vote_type_id => 2 })
			if @new_vote.save
			 	@new_vote.comment.de_voted
			 	@new_vote.comment.save
			end	
			redirect_to article_path(@new_vote.comment.article_id)
		end
	end
end
