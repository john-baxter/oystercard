# to require
# require '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'

class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def view_balance
    @balance
  end
end