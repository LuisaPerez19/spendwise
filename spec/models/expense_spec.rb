require 'rails_helper'

RSpec.describe Expense, type: :model do

  before(:each) do
    @expense_one = create(:expense)
    # puts @expense_one.inspect
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

    it 'returns the correct sum for a given date range' do

      expenses = [
        ["2024/7/25", 50],
        ["2024/8/1", 50]
      ]
      category = create(:category)
      expenses.each do |expense_date, amount|

        create(:expense, category:, date: Date.parse(expense_date), amount:)
      end

      test_cases =[
        [["2024/7/25", "2024/8/1"],100],
        [["2024/7/26", "2024/8/8"],50]
      ]

      test_cases.each do |(start_date,end_date),total|
        sd = Date.parse(start_date)
        ed = Date.parse(end_date)

        result = Expense.total_amount_between(sd,ed)

      expect(result).to eq(total), "Failed: #{start_date}-#{end_date}"

      puts "Start Date: #{sd}, End Date: #{ed}"
      puts "All Expenses: #{Expense.all.map { |e| [e.date, e.amount] }}"
      puts "Filtered Expenses: #{Expense.where(date: sd..ed).map { |e| [e.date, e.amount] }}"
      puts "Result: #{result}"

      puts "Expected #{total} for date range #{start_date} to #{end_date}, but got #{result}"
      end

    end
  end
end
