class Expense < ApplicationRecord
  belongs_to :category
  after_create :update_category_total
  after_destroy :update_category_total
  belongs_to :user, optional: true
  validates :title, :amount, :date,  presence: true

  def self.total_amount_between(start_date, end_date)
    where(date: start_date..end_date).sum(:amount)
  end


  private

  def update_category_total
    category.update(amount: category.expenses.map(&:amount).sum)
  end



end
