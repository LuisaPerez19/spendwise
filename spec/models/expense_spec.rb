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

  describe '.total_amount_between' do

    it 'returns the total expenses amount within a date range' do


      expenses = [["2024/7/27", 100]]

      expenses.each do |expense_date, amount|
        create(:expense, category:, date: Date.parse(expense_date), amount:)
      end

      test_cases =[
        [["2024/7/25", "2024/8/1"],100],
        [["2024/7/25", "2024/8/1"],100]
      ]


      test_cases.each do |(start_date,end_date),total|
        sd = Date.parse(start_date)
        ed = Date.parse(end_date)

      end

    end
  end
  # def self.total_amount_between(start_date, end_date)
  #   where(date: start_date..end_date).sum(:amount)
  # end
end
