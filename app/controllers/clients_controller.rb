require './app/models/client'
require 'json'

class ClientsController < Sinatra::Base
  # GET /clients
  get '/clients/' do
    redirect '/clients'
  end

  get '/clients' do
    @clients = Client.all

    content_type :json
    status 200
    @clients.to_json
  end

  # GET /client/:id
  get '/client/:id/' do
    redirect '/client/:id'
  end

  get '/client/:id' do
    @client = Client.find(params[:id])

    halt 404, { 'error' => 'Client not found' }.to_json unless @client.any?

    content_type :json
    status 200
    @client.to_json
  end

  # POST /clients
  post '/clients' do
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

  # PUT /client/:id
  put '/client/:id/' do
    redirect '/client/:id'
  end

  put '/client/:id' do
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

  # DELETE /client/:id
  delete '/client/:id/' do
    redirect '/client/:id'
  end

  delete '/client/:id' do
    @client = Client.delete(params[:id])

    halt 404, { 'error' => 'Client not found' }.to_json unless @client.cmd_tuples.positive?

    content_type :json
    status 200
    { 'success' => 'Client deleted' }.to_json
  end
end
