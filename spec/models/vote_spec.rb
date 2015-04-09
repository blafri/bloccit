require 'rails_helper'

describe Vote, type: :model do
  
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(build(:non_valid_vote).valid?).to eq(false)
      end
    end
  end
  
  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = create(:post)
      vote = build(:up_vote, post: post)
      expect(post).to receive(:update_rank)
      vote.save!
    end
  end
end