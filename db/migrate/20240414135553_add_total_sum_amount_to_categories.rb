class AddTotalSumAmountToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :Total_sum_amount, :integer
  end
end
