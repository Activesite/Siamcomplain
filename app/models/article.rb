# == Schema Information
#
# Table name: articles
#
#  id             :integer(4)      not null, primary key
#  articleTitle   :string(255)
#  articleContent :string(2555)    default(""), not null
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer(4)      not null
#  score          :integer(4)
#

class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :vote_articles


	def voted_up
		self.score += 1
	end
	def de_voted
		self.score -= 1
	end
end
