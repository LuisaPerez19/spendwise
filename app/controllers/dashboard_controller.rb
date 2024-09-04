class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @expenses = @user.expenses.order(created_at: :desc)

    date_today = Time.zone.now

    @date_ranges = {"This Week" => "#{date_today.beginning_of_week.strftime('%Y-%m-%d')}|#{date_today.end_of_week.strftime('%Y-%m-%d')}"}

    @total_expenses = calculate_total_expenses


    respond_to do |format|
      format.html
      format.json {render json: {total_expenses: @total_expenses}}
    end
  end

  private

  def calculate_total_expenses
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date]) rescue nil
      end_date = Date.parse(params[:end_date]) rescue nil
      return Expense.total_amount_between(start_date, end_date)
    end




    date_range = params[:date_range]
    date_today = Time.zone.now

      case date_range
      when 'this_week'
        Expense.total_amount_between(date_today.beginning_of_week, date_today.end_of_week)
      when 'this_month'
        Expense.total_amount_between(date_today.beginning_of_month, date_today.end_of_month)
      when 'this_year'
        Expense.total_amount_between(date_today.beginning_of_year, date_today.end_of_year)
      when 'last_week'
        Expense.total_amount_between(1.week.ago.beginning_of_week, 1.week.ago.end_of_week)
      when 'q1'
        Expense.total_amount_between(date_today.beginning_of_year, date_today.beginning_of_year.end_of_quarter)
      when 'q2'
        Expense.total_amount_between(date_today.beginning_of_year.next_quarter, date_today.beginning_of_year.next_quarter.end_of_quarter)
      when 'q3'
        Expense.total_amount_between(date_today.beginning_of_year.next_quarter.next_quarter, date_today.beginning_of_year.next_quarter.next_quarter.end_of_quarter)
      when 'q4'
        Expense.total_amount_between(date_today.beginning_of_year.next_quarter.next_quarter.next_quarter, date_today.end_of_year)
      else
        0
      end
  end
end
