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

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
