class ApplicationController < ActionController::Base
  helper :all

  helper_method :current_user

  before_action :adjust_format_for_iphone

  private

  def adjust_format_for_iphone
    if request.env["HTTP_USER_AGENT"] &&
        (request.env["HTTP_USER_AGENT"][/(iPhone)/] == "iPhone" ||
         request.env["HTTP_USER_AGENT"][/(Android)/] == "Android")
      request.format = :iphone
    end
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:user_id])
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
