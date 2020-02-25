# to require or load:
# require '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'
# load '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'

class Oystercard

  CARD_MAX = 90.00
  @limit_error = "The limit is £#{CARD_MAX}"

  attr_reader :balance, :in_journey_status

  def initialize
    @balance = 0.00
    @in_journey_status = false
  end

  def top_up(value)
    fail @limit_error if @balance + value > CARD_MAX
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey_status
  end

  def touch_in
    @in_journey_status = true
  end

  def touch_out
    @in_journey_status = false
  end



end