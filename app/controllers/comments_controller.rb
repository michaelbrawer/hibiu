class CommentsController < ApplicationController
  def create
    Comment.create(comment: params[:comment][:comment], user: current_user, post_id: params[:post_id])
    redirect_to post_path(params[:post_id])

  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.create(params[:comment].permit(:comment))
  #   if @comment.save
  #     redirect_to post_path(@post)
  #   else
  #     render 'new'
  #   end
  end

  def destroy
    comment = Comment.find(params[:id])
    post_id = comment.post_id
    comment.destroy
    redirect_to post_path(post_id)
  end
end 