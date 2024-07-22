class DashboardController < ApplicationController
  def index
    @user = current_user
    @expenses = @user.expenses.order(created_at: :desc)
  end
end
