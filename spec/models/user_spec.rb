require 'rails_helper'

describe User do
  it "seeds categories after creating an user" do
    user = User.create(
      email: "luisa@myevent.com",
      password: "123456",
      password_confirmation: "123456"
    )
    expect(user.id).not_to be_nil
    expect(user.categories.count).not_to be_zero
    user_two = User.new(
      email: "luisa@myevent.com",
      password: "123456",
      password_confirmation: "123456"
    )
    expect(user_two).not_to be_valid
  end
end
