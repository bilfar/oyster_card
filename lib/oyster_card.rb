class OysterCard

  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  attr_reader :balance, :entry_station, :exit_station

  def initialize(balance = DEFAULT_BALANCE)
  @balance = balance
  @trips = []

  end

  def top_up(value)
    fail "maximal limit exceed" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "not enough funds" if low_balance?
    @entry_station = station
    @trips << { entry: entry_station }
    # @trips << @tracks
  end

  def touch_out(station)
    subtract_fare(MINIMUM_FARE)
    @exit_station = station
    @trips.last[:exit] = exit_station
    @entry_station = nil
  end

  def in_journey?
    # it converts the value to a boolean and then return the opposite value
    !!entry_station
  end

  def trip_tracker
    @trips
  end

  def low_balance?
    @balance < MINIMUM_FARE
  end

  private
  def subtract_fare(value)
  @balance -= value
  end
end
