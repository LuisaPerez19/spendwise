class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :expenses
  has_many :categories
  validates :email, uniqueness: true, presence:true, format: { with: Devise.email_regexp }
  after_create_commit :seed_categories
  validate :password_complexity
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    private

    def seed_categories
      ["Home", "Food", "Transport", "Going out"].each do |category|
        categories.build(name: category, amount: 0).save!
      end
    end

    def password_complexity
      if password.present?
          if !password.match(/(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-])/)
          errors.add :password, "Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character"
        end
      end
    end
end
