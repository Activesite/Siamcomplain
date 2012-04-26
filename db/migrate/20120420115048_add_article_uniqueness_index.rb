class AddArticleUniquenessIndex < ActiveRecord::Migration
  def up
  	 add_index :articles, :user_id
  end

  def down
  end
end
