class AddScoreToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :score, :integer , :dafault => 0 
  end
end
