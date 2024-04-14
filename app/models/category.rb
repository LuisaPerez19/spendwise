class Category < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, :amount, presence: true
  has_many :expenses
  before_create :initialize_total_amount

  private

  def initialize_total_amount
    self.amount ||= 0
  end

  def update_category_amount_total
    category.update(total_amount: category.sum(:amount))
  end
end
