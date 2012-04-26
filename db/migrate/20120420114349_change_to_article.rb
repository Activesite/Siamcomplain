class ChangeToArticle < ActiveRecord::Migration
    def change
  	remove_column :articles,:user_id
    add_column :articles, :user_id , :int

  end


  def down
  end
end
