class AddColumnsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_id, :integer
    add_column :questions, :content, :text
  end
end
