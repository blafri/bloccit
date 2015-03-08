class SummariesController < ApplicationController
  def new
    @summary = Summary.new
    authorize @summary
    
    post = Post.find(params[:post_id])
    if post.summary
      flash[:error] = "A Summary for this post already exists."
      redirect_to action: 'show'
    end
  end

  def show
    @topic = Post.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    
    authorize @summary
  end

  def edit
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    
    authorize @summary
  end
  
  def create
    @post = Post.find(params[:post_id])
    @summary = @post.build_summary(params.require(:summary).permit(:body))
    
    authorize @summary
    
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to action: "show"
    else
      flash[:error] = "There was an error saving the summary. Please try again"
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    
    authorize @summary
    
    if @summary.update_attributes(params.require(:summary).permit(:body))
      flash[:notice] = "Summary was updated"
      redirect_to action: "show"
    else
      flash[:error] = "There was an error updating the summary. Please try again"
      render :edit
    end
  end
end
