# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

run Sinatra::Application

run Rack::URLMap.new('/' => Sinatra::Application, '/sidekiq' => Sidekiq::Web)