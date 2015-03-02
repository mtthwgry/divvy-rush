class Availability < ActiveRecord::Base
  belongs_to :station

  def time
    created_at.strftime("%b %e %l:%M %p")
  end
end
