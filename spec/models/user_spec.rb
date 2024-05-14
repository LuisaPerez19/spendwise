require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user_one = create(:user)
    puts @user_one.inspect
  end

  it "is valid with valid attributes" do
    expect(@user_one).to be_valid
  end
  it "seeds categories after creating an user" do
    expect(@user_one.id).not_to be_nil
    expect(@user_one.categories.count).not_to be_zero
  end

  it "has a unique email" do
    user_two = create(:user, email: "luisa@example.com")
    puts user_two.inspect
    expect(user_two).to_not be_valid
  end

  # Nil id for user_two if I use build. If I used the create will create an id but then the test does not pass. I believe it thinks is the same as user_one.

  it "is not valid without an email" do
    user_three = build(:user, email: nil)
    expect(user_three).to_not be_valid
  end

  it "is not valid without a password" do
    user_without_password = build(:user, password: nil)
    expect(user_without_password).to_not be_valid
  end

  it "meets password complexity" do
    user_with_the_right_password = build(:user, password: "123456
    ", password_confirmation: "123456
    ")
    expect(user_with_the_right_password).to_not be_valid
  end

end






# describe User do
#   it "seeds categories after creating an user" do
#     user = User.create(
#       email: "luisa@myevent.com",
#       password: "123456",
#       password_confirmation: "123456"
#     )
#     expect(user.id).not_to be_nil
#     expect(user.categories.count).not_to be_zero
#   end
# end
