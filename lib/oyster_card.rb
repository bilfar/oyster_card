class OysterCard

  DEFAULT_BALANCE = 0
  MINIMUM_ALLOWANCE = 1
  MAXIMUM_BALANCE = 90
  attr_reader :balance
  attr_accessor :card_tracker

  def initialize(balance = DEFAULT_BALANCE)
  @balance = balance
  @card_tracker = 'Not in use'
  end

  def top_up(value)
    fail "maximal limit exceed" if @balance + value > MAXIMUM_BALANCE
    @balance += value
  end

  def subtract_fare(value)
  @balance -= value
  end

  def touch_in
    fail "not enough funds" if @balance < MINIMUM_ALLOWANCE
    @card_tracker = 'Active'
  end

  def touch_out
    @card_tracker = 'Not in use'
  end

  def in_journey?
    @card_tracker == "Active"
  end
end
