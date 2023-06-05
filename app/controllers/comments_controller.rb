class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: "Comment saved!" }
      else
        format.html { redirect_to post_path(@post), notice: "Can't save comment!" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to post_path(@post), notice: "Comment deleted!" }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
