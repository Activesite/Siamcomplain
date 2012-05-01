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

require 'spec_helper'

describe VoteArticle do
  pending "add some examples to (or delete) #{__FILE__}"
end
