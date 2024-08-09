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

      # create(:category, amount: 100)
      # create(:category, amount: 200)
      # create(:category, amount: 150)

      # expect(Category.category_sum_amount).to eq(450)
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
