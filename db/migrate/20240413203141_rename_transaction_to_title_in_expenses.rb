class RenameTransactionToTitleInExpenses < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses, :transaction, :title
  end
end
