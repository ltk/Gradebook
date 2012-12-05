class SessionsController < ApplicationController
  
  def new; end
  
  def create
    if user = User.authenticate(params[:user][:email], params[:user][:password])
      self.current_user = user
      flash[:notice] = 'Welcome!'
      redirect_to current_user.is_admin? ? admin_dashboard_path : dashboard_path
    else
      flash[:error] =  "Sorry, we couldn't locate a user with those credentials."
      redirect_to login_path
    end
  end

  def destroy
    clear_session
    redirect_to root_path
  end
end