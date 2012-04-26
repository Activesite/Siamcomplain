# == Schema Information
#
# Table name: comments
#
#  id             :integer(4)      not null, primary key
#  commentContent :string(255)
#  user_id        :integer(4)
#  article_id     :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
