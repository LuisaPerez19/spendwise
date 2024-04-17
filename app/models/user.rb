class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :expenses
  has_many :categories
  validates :email, uniqueness: true, presence:true, format: { with: Devise.email_regexp }
  after_create_commit :seed_categories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    private

    def seed_categories
      ["Home", "Food", "Transport", "Going out"].each do |category|
        categories.build(name: category, amount: 0).save!
      end
    end
end
