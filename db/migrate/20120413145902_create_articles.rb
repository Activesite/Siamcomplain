class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :articleTitle
      t.string :articleContent
      t.timestamps
    end
  end
end
