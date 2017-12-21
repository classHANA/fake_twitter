class PostController < ApplicationController
  before_action :authenticate_user, except: :index
  def new
  end

  def create_reply
  	@content = params[:content]
  	@id = params[:id]

  	Reply.create(
  		content: @content,
  		post_id: @id
  		)
  	
  	#rails 4
  	#redirect_to :back 
  	
  	#rails 5
  	redirect_back(fallback_location: "/post/show/#{@id}")
  end

  def show
  	@id = params[:id]
  	@post = Post.find(@id)
  	
  end
  
  def edit
    @id = params[:id]
    @post = Post.find(@id)
    
  end
  
  def update
    @id = params[:id]
    @post = Post.find(@id)
    
    @title = params[:title]
    @content = params[:content]
    
    @post.update(title: @title, content: @content)
    redirect_to "/post/show/#{@id}"
  end

  def destroy
    @id = params[:id]
    @post = Post.find(@id)
    @post.destroy
    redirect_to '/'

  end

  def index
  	@posts = Post.all
  end

  def create
  	@title = params[:title]
  	@content = params[:content]

  	Post.create(
  		title: @title,
  		content: @content
  		)
  	redirect_to '/'

  end


end
