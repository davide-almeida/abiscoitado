require 'sinatra'
require_relative 'app/controllers/hello_controller'
require_relative 'config/database/connect_database'
require_relative 'lib/dotenv_reader'

# .env
DotenvReader.load

# Sinatrinha
class Server < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, ENV['SERVER_PORT'] || 3000

  use HelloController

  run! if app_file == $0
end
