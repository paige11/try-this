class AddTotalVotesColumnToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :total_votes, :integer, default: 0
  end
end
