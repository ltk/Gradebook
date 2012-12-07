class HomeController < ApplicationController
  def index
    if current_user
      redirect_to dashboard_path
    else
      render "index"
    end
  end
end
