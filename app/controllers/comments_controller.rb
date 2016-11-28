class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_with post, comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @post = @comment.post
    @comment.destroy
    respond_with @post.id
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
