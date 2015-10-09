#!/usr/bin/env ruby
#
# scrape patches and put them in a yaml file for processing.
#

require 'net/http'
require 'yaml'
require 'nokogiri'

patches = []

File.open('patches2.yml', 'w') do |f|
    1.upto(4000) do |i|
        uri = URI("http://mbpatches.com/micro/?id=#{i}")
        res = Net::HTTP.get_response(uri)
        doc = Nokogiri::HTML(res.body)
        title = doc.css("h2#title-text").text
        desc = doc.css("p#description-text").text
        url = uri
        id = i
        if title.size > 0 and desc.size > 0
            patches << {'title' => title, 'desc' => desc, 'url' => uri.to_s, 'id' => id}
        end
        if i % 100 == 0
            puts "Working on #{i.to_s} / 4000"
        end
    end
    f.puts YAML.dump(patches)
end

