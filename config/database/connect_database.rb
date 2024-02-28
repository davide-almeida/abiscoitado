require 'pg'
require_relative '../../lib/dotenv_reader'

# .env
DotenvReader.load

#db
class ConnectDatabase
  def self.connection
    @connection ||= PG.connect(
      dbname: ENV['POSTGRES_DB'],
      user: ENV['POSTGRES_USER'],
      password: ENV['POSTGRES_PASSWORD'],
      host: ENV['POSTGRES_HOST'],
      port: ENV['POSTGRES_PORT']
    )
  end
end
