class Station

  attr_reader :zone, :station_name

  def initialize(zone, station_name)
    @zone = zone
    @station_name = station_name
  end

  def station_zone
    @zone
  end

  def station_name
    @station_name
  end

end
