require "faraday"
require "typhoeus/adapters/faraday"
Ethon.logger = Logger.new("/dev/null")

#if Rails.env.production?
#      ENV["ELASTICSEARCH_URL"] = `heroku config:get SEARCHBOX_URL`
#else
#    Searchkick.client = Elasticsearch::Client.new(hosts: ["127.0.0.1:9200", "127.0.0.1:9201"], retry_on_failure: true)
#end
