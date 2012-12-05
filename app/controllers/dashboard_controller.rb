class DashboardController < ApplicationController
  before_filter :login_required

  def index
    redirect_to admin_dashboard_path if current_user.is_admin?
  end
end
