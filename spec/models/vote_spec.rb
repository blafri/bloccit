describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        vote = Vote.new(value: 5)
        expect(vote.valid?).to eq(false)
      end
    end
  end
end