require 'rails_helper'

describe Comment do

  describe "after_create" do

    before(:each) do
      @post = create(:post)
      @user = create(:user)
      @comment = build(:comment, post:@post)
    end
 
    context "with user's permission" do
    
      it "sends an email to users who have favorited the post" do
        create(:favorite, user: @user, post: @post)

        allow( FavoriteMailer )
          .to receive(:new_comment)
          .with(@user, @post, @comment)
          .and_return( double(deliver_now: true) )
        
        expect( FavoriteMailer ).to receive(:new_comment)
        @comment.save!
      end

      it "does not send emails to users who haven't" do
        expect( FavoriteMailer )
          .not_to receive(:new_comment)

        @comment.save!
      end
    end
    
    context "without permission" do
      
      before(:each) { @user.update_attribute(:email_favorites, false) }
      
      it "does not send emails, even to users who have favorited" do
        create(:favorite, user: @user, post: @post)
        
        expect(FavoriteMailer)
          .not_to receive(:new_comment)
        
        @comment.save!
      end
    end
  end
end