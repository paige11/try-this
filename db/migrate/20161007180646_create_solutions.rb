class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
      t.integer :contributor_id
      t.integer :question_id
      t.text :content
      t.timestamps
    end
  end
end
