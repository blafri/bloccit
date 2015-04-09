require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Visiting profiles" do
  
  before(:each) do
    @user = create(:user)
    @post = create(:post, user: @user)
    
    # Need to stub the after_create callback when a comment is created
    # So an email is not sent
    allow( FavoriteMailer )
          .to receive(:new_comment)
          .and_return( double(deliver_now: true) )
    
    @comment = create(:comment, user: @user)
  end
  
  describe "not signed in" do
    
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      
      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      #expect( page ).to have_content(@comment.body)
    end
      
  end
  
  describe "signed in" do
    
    before(:each) do
      login_as(@user, :scope => :user)
    end
    
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      
      expect( page ).to have_content("Hello #{@user.name}") #Prove user logged in successfully
      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      #expect( page ).to have_content(@comment.body)
    end
  end
end