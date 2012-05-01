class CreateVoteTypes < ActiveRecord::Migration
  def change
    create_table :vote_types do |t|
      t.string :type_name

      t.timestamps
    end
  end
end
