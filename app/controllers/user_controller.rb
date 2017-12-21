class UserController < ApplicationController
  def new
  end

  def create
    @email = params[:email]
    @password = params[:password]

    User.create(
      email: @email,
      password: @password
      )

    redirect_to '/'

  end

  def login
  end

  def login_process
    @email = params[:email]
    @password = params[:password]

    user = User.find_by(email: @email)
    
    if User.exists?(email: @email)
      if user.password == @password
        session[:user_id] = user.id
        redirect_to '/'
      end
    end

  end

  def logout
    session.clear
    redirect_to '/'
  end
end





























