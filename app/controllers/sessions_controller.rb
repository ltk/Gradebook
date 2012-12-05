class SessionsController < ApplicationController
  
  def new; end
  
  def create
    if user = User.authenticate(params[:user][:email], params[:user][:password])
      self.current_user = user
      flash[:notice] = 'Welcome!'
      redirect_to root_path
    else
      flash.now[:error] =  "Sorry, we couldn't locate a user with those credentials."
      render :action => :new
    end
  end

  def destroy
    clear_session
    redirect_to root_path
  end
end