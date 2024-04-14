class Expense < ApplicationRecord
  belongs_to :category, optional: true
  after_create :update_category_total
  belongs_to :user, optional: true
  validates :title, :amount, :date,  presence: true

  private

  def update_category_total
    category.update(amount: category.expenses.sum(:amount))
  end

end
