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

require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
