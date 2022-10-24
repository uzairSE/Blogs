class PostsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def index
    #@posts = Post.all
    @user = User.find(params[:user_id])
    @posts = @user.posts.all
  end
  def show
    @post = Post.find(params[:id])
    @user = @post.user_id
  end
  def new
    @user = User.find(params[:user_id])
    @post = Post.new(params[:id])
  end

  def create
    #  binding.pry
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
   
    # @user = User.find(params['user_id'])

    #@post = user.posts.create!(posts_params)

    # @post = Post.new(post_params)
    # @user = @post.user_id
    if @post.save
      # redirect_to @post
      redirect_to user_posts_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = @post.user_id
    redirect_to user_posts_path(@user), status: :see_other
  end
  private
  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
end
