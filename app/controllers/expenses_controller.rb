class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  def index
    @user = current_user
    @expenses = @user.expenses
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: "Expense was successfully created."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_path, notice: "Expense was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path, notice: "Expense was successfully deleted."
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end


  def expense_params
    params[:expense].permit(:title, :amount, :date, :category_id, :user_id)
  end

end
