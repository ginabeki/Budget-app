class AddGroupIdToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :group_id, :bigint
  end
end
