require "oyster_card.rb"

 describe OysterCard do

  describe "balance" do
    it "should start with a balance of 0" do
      expect(OysterCard.new.balance).to eq 0
      end
      it 'should increase by top up amount when card is topped up' do
        oyster = OysterCard.new
        oyster_balance = oyster.balance
        expect(oyster.top_up(50)).to eq oyster_balance + 50
      end
      it "should fail if maximum limit in exceed" do
        oyster = OysterCard.new
        expect { oyster.top_up(100)}.to raise_error "maximal limit exceed"
      end
      it "should deduct credit from my card" do
        oyster = OysterCard.new
        expect {oyster.subtract_fare(50)}.to change {oyster.balance}.by -50
      end
    end

    describe "track journeys" do
      it 'should start checked out' do
        expect(OysterCard.new.card_tracker).to eq 'Not in use'
      end
      it 'should change status when checking in' do
        oyster = OysterCard.new
        oyster.touch_in
        expect(oyster.card_tracker).to eq 'Active'
      end
      it "should change status when checking out" do
        oyster = OysterCard.new
        oyster.touch_in
        oyster.touch_out
        expect(oyster.card_tracker).to eq "Not in use"
      end
      it "#in_journey? to true" do
        oyster = OysterCard.new
        oyster.touch_in
        expect(oyster.in_journey?).to eq(true)
      end
      it "#in_journey? to false" do
        oyster = OysterCard.new
        expect(oyster.in_journey?).to eq(false)
      end



    end
  end
