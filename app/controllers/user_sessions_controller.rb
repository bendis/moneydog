class UserSessionsController < ApplicationController

  layout 'login'

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
    respond_to do |format|
      format.html
      format.iphone
    end
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        flash[:notice] = t "Login successful"
        format.html { redirect_back_or_default account_url }
        format.iphone { redirect_to(expenses_path) }
      else
        format.html { render :action => :new }
        format.iphone { render :action => :new, :layout => false }
      end
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = t "Logout successful"
    redirect_back_or_default new_user_session_url
  end
end
