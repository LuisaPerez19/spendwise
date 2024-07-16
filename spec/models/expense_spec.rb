require 'rails_helper'

RSpec.describe Expense, type: :model do

  before(:all) do
    @expense_one = create(:expense)
    puts @expense_one.inspect
  end



  it "is valid with valid attributes" do
    expect(@expense_one).to be_valid
  end

  it "is not valid with no title" do
    @expense_one.title = nil
    expect(@expense_one).not_to be_valid
  end

  it "is not valid with no amount" do
    @expense_one.amount = nil
    expect(@expense_one).not_to be_valid
  end

end
