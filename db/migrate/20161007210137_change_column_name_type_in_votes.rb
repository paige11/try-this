class ChangeColumnNameTypeInVotes < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :type, :direction
  end
end
