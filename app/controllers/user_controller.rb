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
    
    #유저가 있니?
    if User.exists?(email: @email)
      if user.password == @password
        session[:user_id] = user.id
        flash[:green] = "어서오세요"        
        redirect_to '/'
      else
        #비밀번호가 틀렸음
        flash[:notice] = "비밀번호가 틀렸습니다. 다시 확인해주세요"
        redirect_to '/user/login'
      end
    else
      flash[:notice] = "너 누군지 모르겠어"
      redirect_to '/user/new'
    end

  end

  def logout
    session.clear
    flash[:notice] = "로그아웃 되었습니다."
    redirect_to '/'
  end
end






















































