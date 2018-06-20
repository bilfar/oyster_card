require "oyster_card.rb"

 describe OysterCard do
   let(:station) { double :station }
   let(:station2) { double :station2 }
   let(:oyster) { OysterCard.new }


  describe "balance" do
    it "should start with a balance of 0" do
      expect(oyster.balance).to eq 0
      end
      it 'should increase by top up amount when card is topped up' do
        oyster_balance = oyster.balance
        expect(oyster.top_up(50)).to eq oyster_balance + 50
      end
      it "should fail if maximum limit in exceed" do
        expect { oyster.top_up(100)}.to raise_error "maximal limit exceed"
      end
      it "should deduct credit from my card" do
        expect { oyster.send(:subtract_fare, 50) }.to change {oyster.balance}.by(-50)
      end
      it "should not allow you to travel if balance is below minimum" do
        expect {oyster.touch_in(:station)}.to raise_error "not enough funds"
      end

    end

    describe "track journeys" do
      it 'should start checked out' do
        expect(oyster.in_journey?).to eq false
      end
      it 'should change status when checking in' do
        oyster.top_up(10)
        oyster.touch_in(:station)
        expect(oyster.in_journey?).to eq true
      end
      it "should change status when checking out" do
        oyster.top_up(10)
        oyster.touch_in(:station)
        oyster.touch_out(:station)
        expect(oyster.in_journey?).to eq false
      end
      it 'should set entry station to nil on check out' do
        oyster.top_up(10)
        oyster.touch_in(:station)
        oyster.touch_out(:station)
        expect(oyster.entry_station).to eq(nil)
      end
      it 'should deduct minimum fare when checking out' do
        oyster.top_up(10)
        oyster.touch_in(:station)
        expect{ oyster.touch_out(:station) }.to change { oyster.balance }.by(-OysterCard::MINIMUM_FARE)
      end
      it "#in_journey? to true" do
        oyster.top_up(10)
        oyster.touch_in(:station)
        expect(oyster.in_journey?).to eq(true)
      end
      it "#in_journey? to false" do
        expect(oyster.in_journey?).to eq(false)
      end
      it "should tell you where you traveled from" do
        oyster.top_up(10)
        oyster.touch_in(:station)
        expect(oyster.entry_station). to eq(:station)
      end
      it 'should show all previous journeys' do
        oyster.top_up(10)
        oyster.touch_in(:station)
        oyster.touch_out(:station2)
        expect(oyster.trip_tracker).to eq([{entry: :station, exit: :station2}])
      end
    end
  end
