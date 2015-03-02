require_relative 'environment'

module Clockwork
  handler do |job, time|
    puts "Running #{job} at #{time}."
    DivvyWorker.perform_async
  end

  every 1.minute, 'fire divvy'

end