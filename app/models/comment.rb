# == Schema Information
#
# Table name: comments
#
#  id             :integer(4)      not null, primary key
#  commentContent :string(2555)
#  user_id        :integer(4)
#  article_id     :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  score          :integer(4)      default(0)
#

class Comment < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	
	def voted_up
		self.score += 1
	end
	def de_voted
		self.score -= 1
	end
end
