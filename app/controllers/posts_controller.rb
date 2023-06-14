class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)

    respond_to do |format|
      format.html
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render xml: @post.comments }
      format.json { render json: @post.comments }
    end
  end
end
