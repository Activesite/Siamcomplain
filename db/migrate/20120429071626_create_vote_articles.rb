class CreateVoteArticles < ActiveRecord::Migration
  def change
    create_table :vote_articles do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :vote_type_id

      t.timestamps
    end
    add_index(:vote_articles,[:user_id,:article_id,:vote_type_id],:unique => true) 
  end
end
