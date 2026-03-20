class UserSessionsController < ApplicationController
  layout "login"

  before_action :require_no_user, only: [:new, :create]
  before_action :require_user, only: :destroy

  def new
    respond_to do |format|
      format.html
      format.iphone
    end
  end

  def create
    user = User.find_by(email: params[:email])

    respond_to do |format|
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = t("Login successful")
        format.html { redirect_back_or_default account_url }
        format.iphone { redirect_to expenses_path }
      else
        flash.now[:alert] = t("Invalid email or password")
        format.html { render :new, status: :unprocessable_entity }
        format.iphone { render :new, layout: false, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    reset_session
    flash[:notice] = t("Logout successful")
    redirect_to new_user_session_url
  end
end
