class OysterCard

  DEFAULT_BALANCE = 0
  MINIMUM_ALLOWANCE = 1
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90
  attr_reader :balance
  attr_accessor :in_journey

  def initialize(balance = DEFAULT_BALANCE)
  @balance = balance
  @in_journey = false
  end

  def top_up(value)
    fail "maximal limit exceed" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

  def subtract_fare(value)
  @balance -= value
  end

  def touch_in
    fail "not enough funds" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
