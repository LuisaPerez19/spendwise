class Category < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, :amount, presence: true
end
