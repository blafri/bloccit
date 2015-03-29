class FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    
    authorize favorite

    if favorite.save
      flash[:notice] = "Post Favorited"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was a problem Favoriting the post. Please try again"
      redirect_to [@post.topic, @post]
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post: @post.id)
    
    authorize favorite
    
    if favorite.destroy
      flash[:notice] = "Post unfavorited"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error unfavoriting the post. Please try again."
      redirect_to [@post.topic, @post]
    end
  end
  
end
