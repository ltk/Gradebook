class DashboardController < ApplicationController
  before_filter :login_required
  before_filter :redirect_admins
  before_filter :set_current_semester

  def index
    dashboard = Dashboard.new(current_user, @current_semester)
    @data = dashboard.data
  end

  private

  def redirect_admins
    redirect_to admin_dashboard_path if current_user.is_admin?
  end
end
