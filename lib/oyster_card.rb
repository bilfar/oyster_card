class OysterCard

DEFAULT_BALANCE = 0
attr_reader :balance

def initialize(balance = DEFAULT_BALANCE)
@balance = balance
end

def top_up(value)
  @balance += value
end
end