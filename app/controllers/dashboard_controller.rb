class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index

    @user = current_user
    @expenses = @user.expenses.order(date: :desc)
    start_date = check_and_parse_date(:start_date)
    @expenses = @expenses.where("date > ?", start_date ) if start_date
    end_date = check_and_parse_date(:end_date)
    @expenses = @expenses.where("date < ?", end_date ) if end_date

    @date_ranges = date_ranges
    @total_expenses = @expenses.sum(:amount)


    respond_to do |format|
      format.html
      format.json {render json: {total_expenses: @total_expenses}}
      format.html { render partial: "recent_expenses", locals: { expenses: @expenses } }
    end
  end

  def recent_expenses
    @user = current_user
    @expenses = @user.expenses.order(date: :desc)
    start_date = check_and_parse_date(:start_date)
    @expenses = @expenses.where("date > ?", start_date ) if start_date
    end_date = check_and_parse_date(:end_date)
    @expenses = @expenses.where("date < ?", end_date ) if end_date

    render partial: "recent_expenses", locals: { expenses: @expenses }
  end

  private

  def check_and_parse_date(param_name)
    return nil unless params[param_name].present?
    Date.parse(params[param_name]) rescue nil
  end

end
