class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @comment = Comment.new
  end
 
  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post created"
    else
      render :new
    end
  end
 
  def edit
  end

  def update
    if @post.update(post_params) 
      redirect_to @post, notice: "Post sucessfully updated"
    else
      render :edit
    end
  end

 

  def destroy
    if @post.destroy
      redirect_to root_path, notice: 'Post was successfully destroyed.' 
    end
  end

  private 

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :image, :post_id, :all_tags, :tag)
  end

end
