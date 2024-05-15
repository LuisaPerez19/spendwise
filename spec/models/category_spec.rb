require 'rails_helper'

RSpec.describe Category, type: :model do

  before(:all) do
    @category_one = create(:category)
    puts @category_one.inspect
  end

  it "is valid with valid attributes" do
    expect(@category_one).to be_valid
  end

  it "is not valid with no name" do
    @category_one.name = nil
    expect(@category_one).not_to be_valid
  end

  # it "is not valid with no amount" do
  #   @category_one.amount = nil
  #   expect(@category_one).not_to be_valid
  # end

  it "creates with a zero amount" do
    category_two = create(:category, amount: nil)
    expect(category_two.amount).to be_zero
  end

end
