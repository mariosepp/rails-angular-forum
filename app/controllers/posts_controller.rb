class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destory]

  def index
    respond_with Post.all
  end

  def create
    respond_with Post.create(post_params.merge(user_id: current_user.id))
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    respond_with @post.destroy
  end

  def show
    respond_with Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:content, :title)
  end
end
