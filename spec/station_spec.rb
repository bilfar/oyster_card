require "station"


describe Station do
  let(:station) { Station.new(station_name: "Livepool", zone: 1) }

  # subject {Station.new(zone: 1)}

  it "should know what name of the station is" do
    expect(station.station_name).to eq("Livepool")
  end
  
  it "should know what zone of the station is" do
    expect(station.station_zone).to eq(1)
  end



end
