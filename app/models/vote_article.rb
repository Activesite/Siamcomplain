# == Schema Information
#
# Table name: vote_articles
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)
#  article_id   :integer(4)
#  vote_type_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class VoteArticle < ActiveRecord::Base
	belongs_to :article
	belongs_to :user

	validates(:article_id,{:presence => true,
                           :uniqueness => {:case_sensitive => false }
                          })

end
