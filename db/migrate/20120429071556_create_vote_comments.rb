class CreateVoteComments < ActiveRecord::Migration
  def change
    create_table :vote_comments do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :vote_type_id

      t.timestamps
    end
    add_index(:vote_comments,[:user_id,:comment_id,:vote_type_id],:unique => true) 

  end
end
