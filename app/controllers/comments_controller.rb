class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again"
      @comments = @post.comments
      render 'posts/show'
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
