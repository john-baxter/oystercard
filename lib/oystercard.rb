# to require or load:
# require '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'
# load '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'

class Oystercard

  CARD_MAX = 90.00
  @max_limit_error = "The limit is £#{CARD_MAX}"
  
  CARD_MIN = 1.00
  @min_limit_error = "The minimum balance to travel is £#{CARD_MIN}"

  attr_reader :balance, :in_journey_status

  def initialize
    @balance = 0.00
    @in_journey_status = false
  end

  def top_up(value)
    fail @max_limit_error if @balance + value > CARD_MAX
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey_status
  end

  def touch_in
    fail @min_limit_error if @balance < CARD_MIN
    @in_journey_status = true
  end

  def touch_out
    @in_journey_status = false
  end



end