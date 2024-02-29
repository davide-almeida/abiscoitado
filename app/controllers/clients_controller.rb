require './app/models/client'
require 'json'

class ClientsController < Sinatra::Base
  # GET /api/v1/clients
  get '/api/v1/clients/' do
    redirect '/api/v1/clients'
  end

  get '/api/v1/clients' do
    Yabeda.abiscoitado.request_counter.increment({endpoint: 'clients'}, by: 1)

    @clients = Client.all

    content_type :json
    status 200
    @clients.to_json
  end

  # GET /api/v1/clients/:id
  get '/api/v1/clients/:id/' do
    redirect '/api/v1/clients/:id'
  end

  get '/api/v1/clients/:id' do
    Yabeda.abiscoitado.request_counter.increment({endpoint: "clients/#{params[:id]}"}, by: 1)

    @client = Client.find(params[:id])

    MetricsController::ERRORS_COUNTER.increment unless @client.any?
    halt 404, { 'error' => 'Client not found' }.to_json unless @client.any?

    content_type :json
    status 200
    @client.to_json
  end

  # POST /api/v1/clients
  post '/api/v1/clients' do
    Yabeda.abiscoitado.request_counter.increment({endpoint: "create_client"}, by: 1)

    @client = JSON.parse(request.body.read, symbolize_names: true)

    halt 400, { 'error' => 'JSON required' }.to_json unless request.content_type == 'application/json'
    halt 400, { 'error' => 'Name and email are required' }.to_json unless @client[:name] && @client[:email]
    halt 400, { 'error' => 'Name is required' }.to_json unless @client[:name].match?(/\A[\w\s]+\z/)
    halt 400, { 'error' => 'Invalid email' }.to_json unless @client[:email].match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)

    @client = Client.create(@client)

    content_type :json
    status 201
    { 'success' => 'Client created' }.to_json
  end

  # PUT /api/v1/clients/:id
  put '/api/v1/clients/:id/' do
    redirect 'api/v1/clients/:id'
  end

  put '/api/v1/clients/:id' do
    @client = JSON.parse(request.body.read, symbolize_names: true)

    halt 404, { 'error' => 'Client not found' }.to_json unless Client.find(params[:id]).any?
    halt 400, { 'error' => 'JSON required' }.to_json unless request.content_type == 'application/json'
    halt 400, { 'error' => 'Name and email are required' }.to_json unless @client[:name] && @client[:email]
    halt 400, { 'error' => 'Name is required' }.to_json unless @client[:name].match?(/\A[\w\s]+\z/)
    halt 400, { 'error' => 'Invalid email' }.to_json unless @client[:email].match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)

    @client = Client.update(params[:id], @client)

    content_type :json
    status 201
    { 'success' => 'Client updated' }.to_json
  end

  # DELETE /api/v1/clients/:id
  delete '/api/v1/clients/:id/' do
    redirect 'api/v1/clients/:id'
  end

  delete '/api/v1/clients/:id' do
    @client = Client.delete(params[:id])

    halt 404, { 'error' => 'Client not found' }.to_json unless @client.cmd_tuples.positive?

    content_type :json
    status 200
    { 'success' => 'Client deleted' }.to_json
  end
end
