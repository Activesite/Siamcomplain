# == Schema Information
#
# Table name: articles
#
#  id             :integer(4)      not null, primary key
#  articleTitle   :string(255)
#  articleContent :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Article < ActiveRecord::Base
end
