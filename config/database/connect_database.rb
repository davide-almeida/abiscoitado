require 'pg'

class ConnectDatabase
  def initialize
    @connection = PG.connect(
      dbname: ENV['POSTGRES_DB'],
      user: ENV['POSTGRES_USER'],
      password: ENV['POSTGRES_PASSWORD'],
      host: ENV['POSTGRES_HOST']
    )
  end
end
