class AdminDashboardController < ApplicationController
  before_filter :login_required
  before_filter :only_allow_admins
  before_filter :set_current_semester

  def index
    dashboard = AdminDashboard.new(@current_semester)
    @data = dashboard.data
  end

  private

  def only_allow_admins
    redirect_to dashboard_path unless current_user.is_admin?
  end
end
