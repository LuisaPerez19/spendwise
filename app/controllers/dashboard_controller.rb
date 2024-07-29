class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @expenses = @user.expenses.order(created_at: :desc)

    selected_date = params[:selected_date].blank? ? Time.zone.now.to_date : Date.parse(params[:selected_date])

    start_of_period = selected_date.beginning_of_month
    end_of_period = selected_date.end_of_month

    @period_expenses = Expense.where(date: start_of_period..end_of_period).sum(:amount)

    #total spend
    # Total earned
    # Filter per month
  end
end
