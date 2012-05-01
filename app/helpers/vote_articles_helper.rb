module VoteArticlesHelper
	def voted_up_article?(article)
		!VoteArticle.where(:article_id => article.id ,:user_id => current_user,:vote_type_id => 1, ).first.nil?
	end
	def voted_down_article?(article)
		!VoteArticle.where(:article_id => article.id ,:user_id => current_user,:vote_type_id => 2, ).first.nil?
	end
	def not_voted_article?(article)
		VoteArticle.where("article_id = ? AND user_id = ?", article.id,current_user.id).first.nil?
	end
end
