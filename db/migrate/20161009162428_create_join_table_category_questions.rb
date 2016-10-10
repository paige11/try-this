class CreateJoinTableCategoryQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :category_questions do |t|
      t.integer :question_id
      t.integer :category_id
    end
  end
end
