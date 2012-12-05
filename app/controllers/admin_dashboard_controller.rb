class AdminDashboardController < ApplicationController
  before_filter :login_required
  before_filter :only_allow_admins

  def index; end

  private

  def only_allow_admins
    redirect_to dashboard_path unless current_user.is_admin?
  end
end
