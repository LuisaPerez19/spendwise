class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_date_ranges
  before_action :set_filtered_expenses, only: [:index, :recent_expenses]
  def index
    @total_expenses = @expenses.sum(:amount)
  end

  def recent_expenses
    render  partial: "recent_expenses",
            locals: { expenses: @expenses },
            turbo_frame: :recent_expenses
  end

  private

  def set_date_ranges
    @date_ranges = date_ranges
  end

  def set_filtered_expenses
    @user = current_user
    @expenses = @user.expenses.order(date: :desc)
    apply_date_filters
  end

  def apply_date_filters
    # if params[:date_filter].present?
    #   if @date_ranges.key?(params[:date_filter])
    #     start_date, end_date = @date_ranges[params[:date_filter]].split('|')
    #     params[:start_date] = start_date
    #     params[:end_date] = end_date
    #   end
    # end

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

end
