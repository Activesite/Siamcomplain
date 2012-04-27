class CreateComments < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
      t.string :commentContent
      t.integer :user_id
      t.integer :article_id
      t.timestamps
  	end

  end

  def down
  end
end
