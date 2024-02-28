require 'pg'
require './config/database/connect_database'

class Client
  def self.all
    all_query = <<~SQL
      SELECT *
      FROM clients
    SQL
    result = conn.exec_params(all_query)
    result.map { |row| row.to_h }
  end

  def self.find(id)
    find_query = <<~SQL
      SELECT *
      FROM clients
      WHERE id = $1
    SQL
    result = conn.exec_params(find_query, [id])
    result.map { |row| row.to_h }
  end

  def self.create(client)
    create_query = <<~SQL
      INSERT INTO clients (name, address, phone_number, email)
      VALUES ($1, $2, $3, $4)
    SQL
    conn.exec_params(create_query, [client[:name], client[:address], client[:phone_number], client[:email]])
  end

  def self.update(id, client)
    update_query = <<~SQL
      UPDATE clients
      SET name = $1, address = $2, phone_number = $3, email = $4
      WHERE id = $5
    SQL
    conn.exec_params(update_query, [client[:name], client[:address], client[:phone_number], client[:email], id])
  end

  def self.delete(id)
    delete_query = <<~SQL
      DELETE FROM clients
      WHERE id = $1
    SQL
    conn.exec_params(delete_query, [id])
  end

  private

  def self.conn
    @conn ||= ConnectDatabase.connection
  end
end
