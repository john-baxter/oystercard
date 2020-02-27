# to require or load:
# require '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'
# load '~/Dropbox/makers_projects/makers_week_02/oystercard/lib/oystercard.rb'

class Oystercard

  CARD_MAX = 90.00
  @max_limit_error = "The limit is £#{CARD_MAX}"

  CARD_MIN = 1.00
  @min_limit_error = "The minimum balance to travel is £#{CARD_MIN}"

  attr_reader :balance, :entry_station, :exit_station, :journey_list, :journey

  def initialize
    @balance = 0.00
    @entry_station = nil
    @exit_station = nil
    @journey_list = []
    @journey = {}
  end

  def top_up(value)
    fail @max_limit_error if @balance + value > CARD_MAX
    @balance += value
  end


  def in_journey?
    true if @entry_station
  end

  def touch_in(station)
    fail @min_limit_error if @balance < CARD_MIN
    @journey = {}
    @entry_station = station
    @journey = {@entry_station => nil}
  end

  def touch_out(station)
    deduct(1.00)
    @exit_station = station
    @journey[@entry_station] = @exit_station
    @journey_list << @journey
    @entry_station = nil
    @exit_station = nil
    # @journey = {}
  end

  private
  def deduct(fare)
    @balance -= fare
  end


end
