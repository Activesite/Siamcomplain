class AddIndexToComments < ActiveRecord::Migration
  def change
  	add_index(:comments,:user_id)
	add_index(:comments,:article_id)
  end
end
