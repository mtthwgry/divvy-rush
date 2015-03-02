require 'net/http'
require 'json'

class DivvyStation
  attr_reader :name, :status, :total_docks, :bikes_available

  def initialize(station_data)
    @name = station_data.fetch("stationName")
    @status = station_data.fetch("statusValue")
    @total_docks = station_data.fetch("totalDocks")
    @bikes_available = station_data.fetch("availableBikes")
  end

  def to_s
    "#{name}:\n\tstatus: #{status}\n\tdocks: #{total_docks}\n\tbikes: #{bikes_available}"
  end
end

uri = URI.parse("http://www.divvybikes.com/stations/json")
response = Net::HTTP.get_response(uri)

stations = []

divvy_json = JSON.parse(response.body)
puts divvy_json.keys

divvy_json["stationBeanList"].each do |station_data|
  stations << DivvyStation.new(station_data)
end

stations.each do |station|
  puts station
end

puts "Station count: #{stations.count}"

active = stations.select { |station| station.status == "In Service" }
inactive = stations.reject { |station| station.status == "In Service" }

puts "Number of active stations: #{active.count}"
puts "Number of inactive stations: #{inactive.count}"
puts inactive.first

divvy_json["stationBeanList"].first.each do |k,v|
  puts "#{k}: #{v}"
end