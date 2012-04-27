class UpdateArticle < ActiveRecord::Migration
  def change
  	remove_column :articles,:userName
  end
end