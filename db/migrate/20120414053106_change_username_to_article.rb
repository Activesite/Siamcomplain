class ChangeUsernameToArticle < ActiveRecord::Migration
  def up
  	change_table :articles do |t|
  		t.rename :username,:userName
  	end
  end

  def down
  end
end
