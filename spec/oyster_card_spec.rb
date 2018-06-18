require "oyster_card.rb"

 describe OysterCard do

  describe "balance" do
    it "should start with a balance of 0" do
      expect(OysterCard.new.balance).to eq 0
      end
    end
  end
