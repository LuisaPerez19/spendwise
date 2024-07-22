class Expense < ApplicationRecord
  belongs_to :category
  after_create :update_category_total
  after_destroy :update_category_total
  belongs_to :user, optional: true
  validates :title, :amount, :date,  presence: true


  private

  def update_category_total
    category.update(amount: category.expenses.map(&:amount).sum)
  end

end
