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

require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
