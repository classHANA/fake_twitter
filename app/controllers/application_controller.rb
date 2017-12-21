class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  	@user ||= User.find(session[:user_id]) if User.exists? && session[:user_id]
  end

  helper_method :current_user

  def authenticate_user
  	unless current_user
  		flash[:notice] = "로그인을 해야 게시판을 볼수 있습니다."
  		redirect_to '/user/login'
  	end
  end

end
