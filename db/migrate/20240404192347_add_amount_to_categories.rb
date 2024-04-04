class AddAmountToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :amount, :integer
  end
end
