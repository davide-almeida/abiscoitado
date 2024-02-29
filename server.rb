require_relative 'config/database/connect_database'
require_relative 'lib/dotenv_reader'
require_relative 'app/controllers/hello_controller'
require_relative 'app/controllers/clients_controller'

# .env
DotenvReader.load

# Sinatrinha
class Server < Sinatra::Base
  # configure :production, :development do
  #   enable :logging
  # end

  # set :bind, '0.0.0.0'
  # set :port, ENV['SERVER_PORT'] || 3000

  use HelloController
  use ClientsController

  # run! if app_file == $0
end
