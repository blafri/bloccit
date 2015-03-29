require 'rails_helper'

describe User do
  
  include TestFactories
  
  before do
    @post = associated_post
    @user = @post.user
  end
  
  describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to eq(nil)
    end
    
    it "returns the appropriate favortie if it exists" do
      favorite = create_favorite(@user, @post)
      expect( @user.favorited(@post) ).to eq(favorite)
    end
    
    it "returns `nil` if the user has favorited another post" do
      new_post = associated_post
      create_favorite(@user, new_post)
      
      expect( @user.favorited(@post) ).to eq(nil)
    end
  end
end
