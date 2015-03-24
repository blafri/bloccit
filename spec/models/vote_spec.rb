require 'rails_helper'

describe Vote, type: :model do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(Vote.new(value: 5).valid?).to eq(false)
      end
    end
  end
end
