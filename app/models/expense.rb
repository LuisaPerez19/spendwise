class Expense < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true
  validates :title, :amount, :date,  presence: true
end
