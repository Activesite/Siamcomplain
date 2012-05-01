class VoteArticlesController < ApplicationController
	def de_vote
		if signed_in? 
		voted_article = params[:voted_article]
		@new_vote = VoteArticle.where({ :article_id => voted_article,
										:user_id => current_user.id})
		@new_vote.vote_type_id = 3
			if @new_vote.save
			 	@new_vote.article.de_voted
			 	@new_vote.article.save
				

			end	
			redirect_to article_path(@new_vote.article_id)
		end
	end
	def up
		if signed_in? 
		voted_article = params[:voted_article]
		@new_vote = current_user.vote_articles.build({ 	:user_id => current_user.id, 
														:article_id => voted_article, 
														:vote_type_id => 1 })
			if @new_vote.save
			 	@new_vote.article.voted_up
			 	@new_vote.article.save
				

			end	
			redirect_to article_path(@new_vote.article_id)
		end
	end
	def down
		if signed_in? 
		voted_article = params[:voted_article]
		@new_vote = current_user.vote_articles.build({ 	:user_id => current_user.id, 
														:article_id => voted_article, 
														:vote_type_id => 2 })
			if @new_vote.save
			 	@new_vote.article.de_voted
			 	@new_vote.article.save
			end	
			redirect_to article_path(@new_vote.article_id)
		end
	end
end
