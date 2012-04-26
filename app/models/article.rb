# == Schema Information #
# Table name: articles
#
#  id             :integer(4)      not null, primary key
#  articleTitle   :string(255)
#  articleContent :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer(4)
#

class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
end
