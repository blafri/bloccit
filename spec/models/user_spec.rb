require 'rails_helper'

describe User do
  
  before do
    # Create a user and a post
    #@user1 = create(:user)
    #@post1 = create(:post, user: @user1)
    #create(:comment, user: @user1, post: @post1)
    @user1 = create(:user_with_post_and_comment)
    
    # Create a second user and a post
    #@user2 = create(:user)
    #@post2 = create(:post, user: @user2)
    #2.times { create(:comment, user: @user2, post: @post2) }
    @user2 = create(:user_with_post_and_comment, comment_count: 2)
  end
  
  describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      expect( @user1.favorited(@user2.posts.first) ).to eq(nil)
    end
    
    it "returns the appropriate favortie if it exists" do
      favorite = create(:favorite, user: @user1, post: @user2.posts.first)
      expect( @user1.favorited(@user2.posts.first) ).to eq(favorite)
    end
    
    it "returns `nil` if the user has favorited another post" do
      new_post = create(:post)
      create(:favorite, user: @user1, post: new_post)
      
      expect( @user1.favorited(@user2.posts.first) ).to eq(nil)
    end
  end
  
  describe ".top_rated" do
    it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end
    
    it "stores a `posts_count` on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end
    
    it "stores a `comments_count` on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end
end
