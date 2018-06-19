class OysterCard

  DEFAULT_BALANCE = 0
  MINIMUM_ALLOWANCE = 1
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90
  attr_reader :balance, :entry_station
  attr_accessor :in_journey


  def initialize(balance = DEFAULT_BALANCE)
  @balance = balance
  end

  def top_up(value)
    fail "maximal limit exceed" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "not enough funds" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    subtract_fare(MINIMUM_FARE)
    @entry_station = nil

  end

  def in_journey?
    # it converts the value to a boolean and then return the opposite value
    !!entry_station
  end

  private
  def subtract_fare(value)
  @balance -= value
  end
end
