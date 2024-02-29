require 'sinatra/base'
require './server'
require 'yabeda'
require 'yabeda/prometheus'
require 'rack'

Yabeda.configure do
  group :abiscoitado do
    counter   :request_counter, comment: "Total number of requests", tags: %i[endpoint]
  end
end

Yabeda.configure!

use Yabeda::Prometheus::Exporter
Yabeda::Prometheus::Exporter.start_metrics_server!

run Server
