class Station < ActiveRecord::Base
  has_many :availabilities

  def current_availability
    availabilities.last
  end

  def current_bikes
    current_availability.bikes
  end

  def current_docks
    current_availability.docks
  end

  def recent_availabilities
    availabilities.last(20)
  end

  def hot?
    hot_bikes? || hot_docks?
  end

  def hot_bikes?
    recent = recent_availabilities
    now = recent.first
    previous = recent.last
    (previous.bikes - now.bikes) > 1
  end

  def hot_docks?
    recent = recent_availabilities
    now = recent.first
    previous = recent.last
    (previous.docks - now.docks) > 1
  end
end