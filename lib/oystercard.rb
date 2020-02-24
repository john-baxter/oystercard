# to require
# require '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'

class Oystercard

  CARD_MAX = 90.00
  @limit_error = "The limit is £#{CARD_MAX}"

  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def top_up(value)
    fail @limit_error if @balance + value > CARD_MAX
    # fail "#{limit_error}" if @balance + value > CARD_MAX
    @balance += value
  end



end