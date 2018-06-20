require "station"


describe Station do
  let(:station) { Station.new(1, "Livepoool") }

  # subject {Station.new(zone: 1)}

  it "should know what zone of the station is" do
    expect(station.station_zone).to eq(1)
  end

  it "should know what name of the station is" do
    expect(station.station_name).to eq("Livepoool")
  end

end
