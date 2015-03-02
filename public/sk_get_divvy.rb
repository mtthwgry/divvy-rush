require 'sidekiq'

class FetchDivvyAPI
  include Sidekiq::Worker

  def perform
    uri = URI.parse("http://www.divvybikes.com/stations/json")
    response = Net::HTTP.get_response(uri)
  end
end