require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']
