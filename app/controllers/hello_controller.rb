require 'json'

class HelloController < Sinatra::Base
  get '/' do
    content_type :json

    { hello: 'world' }.to_json
  end
end
