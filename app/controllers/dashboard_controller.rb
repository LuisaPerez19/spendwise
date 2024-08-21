class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @expenses = @user.expenses.order(created_at: :desc)



    start_date = Date.parse(params[:start_date]) rescue nil
    end_date = Date.parse(params[:end_date]) rescue nil

    @total_expenses = if start_date && end_date
                        Expense.total_amount_between(start_date, end_date)
                      else
                        0
                      end
    #total spend
    # Total earned
    # Filter per month
  end
end
