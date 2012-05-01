module VoteCommentsHelper
	def voted_up_comment?(comment)
		!VoteComment.where(:comment_id => comment.id ,:user_id => current_user,:vote_type_id => 1, ).first.nil?
	end
	def voted_down_comment?(comment)
		!VoteComment.where(:comment_id => comment.id ,:user_id => current_user,:vote_type_id => 2, ).first.nil?
	end
	def not_voted_comment?(comment)
		VoteComment.where("comment_id = ? AND user_id = ?", comment.id,current_user.id).first.nil?
	end
end
 