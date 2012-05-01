# == Schema Information
#
# Table name: vote_comments
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)
#  comment_id   :integer(4)
#  vote_type_id :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class VoteComment < ActiveRecord::Base
	belongs_to :comment
	belongs_to :user
	validates(:user_id,{:presence => true,
                           :uniqueness => {:case_sensitive => false }
                          })
end
