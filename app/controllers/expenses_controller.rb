class ExpensesController < ApplicationController
  before_action :set_expense, only: [ :index, :show ]
  before_action :set_category, only: [ :new, :create ]

  def index
    @expenses = current_user.expenses
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    @expense.category = Category.find(params[:category_id])
    if @expense.save
      redirect_to expenses_path, notice: "Expense was successfully created."
    else
      render :new
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def expense_params
    params[:expense].permit(:transation, :amount, :date, :category_id, :user_id)
  end

end
