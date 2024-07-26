class DashboardController < ApplicationController
  def index
    @user = current_user
    @expenses = @user.expenses.order(created_at: :desc)


    selected_date = params[:selected_date].blank? ? Time.zone.now.to_date : Date.parse(params[:selected_date])

    start_of_period = selected_date.beginning_of_month
    end_of_period = selected_date.end_of_month

    @period_expenses = Expense.where(date: start_of_period..end_of_period).sum(:amount)

    # Calculate the total expenses for the period
    # @total_period_expenses = @period_expenses

    # date = params[:date]
    # if date.present?
    #   start_date = params[date].to_date
    #   end_date = params[date].to_date
    #   @total_expenses = @user.expenses.where(date: start_date..end_date).sum(:amount)
    # end



    # date = params[:date]
    # if date.present?
    #   @total_spent = @user.expenses.amount.sum
    # end


    # @user = current_user



    #total spend
    # Total earned
    # Filter per month
  end
end
