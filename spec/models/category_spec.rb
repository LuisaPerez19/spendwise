require 'rails_helper'

RSpec.describe Category, type: :model do

  describe '#category_total' do
    let(:category) { create(:category) }

    it 'returns the sum of all expense amounts' do
      test_cases = [ [[100,200,150], 450], [[100, 0, 100, 100], 300] ]

      test_cases.each do |amounts, total|
        category = create(:category)
        amounts.each {|amount| create(:expense, category:, amount:)}
        category.reload
        expect(category.category_total).to eq(total)
      end

      # puts "Expense amounts: #{category.expenses.pluck(:amount)
    end
  end

  describe '.category_sum_amount' do
    it 'returns the sum of amounts from all categories' do
      test_cases = [ [[100,200,150], 450], [[100, 0, 100, 100], 300] ]
      test_cases.each do |amounts, total|
        amounts.each {|amount| create(:category, amount:)}
        expect(Category.category_sum_amount).to eq(total)
        Category.destroy_all
      end
    end
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
        [["2024/7/26", "2024/8/8"],100]
      ]

      test_cases.each do |(start_date,end_date),total|
        sd = Date.parse(start_date)
        ed = Date.parse(end_date)

        result = Expense.total_amount_between(sd,ed)

      expect(result).to eq(total)

      puts "Start Date: #{sd}, End Date: #{ed}"
      puts "All Expenses: #{Expense.all.map { |e| [e.date, e.amount] }}"
      puts "Filtered Expenses: #{Expense.where(date: sd..ed).map { |e| [e.date, e.amount] }}"
      puts "Result: #{result}"

      puts "Expected #{total} for date range #{start_date} to #{end_date}, but got #{result}"
      end

    end
  end


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

    it "is not valid with no amount" do
      @category_one.amount = nil
      expect(@category_one).not_to be_valid
    end

    it "creates with a zero amount" do
      category_two = create(:category, amount: 0)
      # puts @category_two.inspect
      expect(category_two.amount).to be_zero
    end
end
