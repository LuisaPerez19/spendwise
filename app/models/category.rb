class Category < ApplicationRecord
  belongs_to :user
  validates :name, :amount, presence: true
  has_many :expenses
  before_validation :initialize_total_amount

  def category_total
    expenses.map(&:amount).sum
    # (&:amount)shorhand for  { |expense| expense.amount }
  end

  private

  def initialize_total_amount
    self.amount ||= 0
  end

  def self.category_sum_amount(user)
    where(user_id: user.id).sum(:amount)
  end

end
