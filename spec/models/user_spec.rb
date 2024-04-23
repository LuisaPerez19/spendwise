require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user1 = create(:user)
  end

  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end
  it "seeds categories after creating an user" do
    expect(@user1.id).not_to be_nil
    expect(@user1.categories.count).not_to be_zero
  end

  it "has a unique email" do
    user2 = build(:user, email: "bob@gmail.com")
    expect(user2).to_not be_valid
  end

  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
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

# describe User do
#   it "checks email is invalid" do
#     user_two = User.new(
#       email: "luisa@myevent.com",
#       password: "123456",
#       password_confirmation: "123456"
#     )
#     expect(user_two).not_to be_valid
#   end
# end

# describe User do
#   it "checks is unique" do
#     user_three = User.new(
#       email: "luisa@myevent.com",
#       password: "123456",
#       password_confirmation: "123456"
#     )
#     expect(user_three).not_to be_unique
#   end
# end
