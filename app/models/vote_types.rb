# == Schema Information
#
# Table name: vote_types
#
#  id         :integer(4)      not null, primary key
#  type_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VoteTypes < ActiveRecord::Base
end
