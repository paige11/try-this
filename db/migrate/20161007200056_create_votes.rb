class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :solution_id
      t.string :type
      t.timestamps
    end
  end
end
