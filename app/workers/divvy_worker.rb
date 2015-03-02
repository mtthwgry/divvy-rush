class DivvyWorker
  include Sidekiq::Worker

  def perform
    uri = URI.parse("http://www.divvybikes.com/stations/json")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json["stationBeanList"].each do |station_data|
      station = Station.find_or_initialize_by(name: station_data.fetch("stationName"))
      station.total_docks = station_data.fetch("totalDocks")
      station.in_service = station_data.fetch("statusValue")
      station.save

      station.availabilities.create(
        bikes: station_data.fetch("availableBikes"),
        docks: station_data.fetch("availableDocks"),
        created_at: json.fetch("executionTime")
      )
    end
  end
end