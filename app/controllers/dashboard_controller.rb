class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_filtered_expenses, only: [:index, :recent_expenses]
  def index
    @date_ranges = date_ranges
    @total_expenses = @expenses.sum(:amount)


    respond_to do |format|
      format.html
      format.json {render json: {total_expenses: @total_expenses}}
      format.html { render_recent_expenses }
    end
  end

  def recent_expenses
    render_recent_expenses
  end

  private

  def set_filtered_expenses
    @user = current_user
    @expenses = @user.expenses.order(date: :desc)
    apply_date_filters
  end

  def apply_date_filters
    if (start_date = check_and_parse_date(:start_date))
      @expenses = @expenses.where("date > ?", start_date)
    end

    if (end_date = check_and_parse_date(:end_date))
      @expenses = @expenses.where("date < ?", end_date)
    end
  end

  def check_and_parse_date(param_name)
    return nil unless params[param_name].present?
    Date.parse(params[param_name]) rescue nil
  end

  def render_recent_expenses
    render  partial: "recent_expenses",
            locals: { expenses: @expenses },
            turbo_frame: :recent_expenses
  end

end
