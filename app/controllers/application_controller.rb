class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def quarter_range(quarter, date_today = Time.zone.now)
    start_date = date_today.beginning_of_year + quarter.months
    end_date = start_date.end_of_quarter
    "#{start_date.strftime('%Y-%m-%d')}|#{end_date.strftime('%Y-%m-%d')}"
  end

  def date_ranges(date_today = Time.zone.now )
    {
      "Last week" => "#{1.week.ago.beginning_of_week.strftime('%Y-%m-%d')}|#{(1.week.ago.end_of_week + 1.day).strftime('%Y-%m-%d')}",
      "This Week" => "#{date_today.beginning_of_week.strftime('%Y-%m-%d')}|#{(date_today.end_of_week + 1).strftime('%Y-%m-%d')}",
      "This month" => "#{date_today.beginning_of_month.strftime('%Y-%m-%d')}|#{date_today.end_of_month.strftime('%Y-%m-%d')}",
      "This year" => "#{date_today.beginning_of_year.strftime('%Y-%m-%d')}|#{date_today.end_of_year.strftime('%Y-%m-%d')}",
      "Q1" => quarter_range(0, date_today),
      "Q2" => quarter_range(3, date_today),
      "Q3" => quarter_range(6, date_today),
      "Q4" => quarter_range(9, date_today)
    }
  end
end
