class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :transaction, :amount, :date,  presence: true
end
