class Station

  attr_reader :name, :zone

  def initialize(station)
    @name = station[:station_name]
    @zone = station[:zone]
  end

  def station_zone
    @zone
  end

  def station_name
    @name
  end

end
