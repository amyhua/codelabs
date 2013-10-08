class ApplicationController < ActionController::Base
  protect_from_forgery

  
  helper_method :current_users_list
  
  protected
  

  def require_admin
    unless current_user.admin
      redirect_to :back, alert: 'You must be an admin to do that. Please request admin access from a current admin.'
    end
  end

  def require_current_user
    unless User.find(params[:id]) = current_user
      redirect_to :back, alert: 'Please login as this user first.'
    end
  end

  def not_authenticated
    redirect_to root_path, :alert => "Please login first."
  end
  
  def current_users_list
    current_users.map {|u| u.email}.join(", ")
  end

end
