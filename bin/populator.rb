require 'net/http'
require 'yaml'
require 'nokogiri'

@patches = []
@patch_list = YAML.load_file('bin/patches3.yml')
@patch_list.each do |patch_entry|
    begin
        uri = URI(patch_entry['url'])
        puts "getting " + patch_entry['url']
        res = Net::HTTP.get_response(uri)
        doc = Nokogiri::HTML(res.body)
    rescue
        next
    end

    patch = Patch.new

    patch.title = doc.css("h2#title-text").text
    patch.description = doc.css("p#description-text").text
    patch.sub_fifth = doc.css("input[name='k1']")[0]["value"]
    patch.overtone = doc.css("input[name='k2']")[0]["value"]
    patch.ultra_saw = doc.css("input[name='k3']")[0]["value"]
    patch.saw = doc.css("input[name='k4']")[0]["value"]
    patch.pulse_width = doc.css("input[name='k5']")[0]["value"]
    patch.square = doc.css("input[name='k6']")[0]["value"]
    patch.metalizer = doc.css("input[name='k7']")[0]["value"]
    patch.triangle = doc.css("input[name='k8']")[0]["value"]
    patch.cutoff = doc.css("input[name='k9']")[0]["value"]
    patch.mode = doc.css("input[name='t1']")[0]["value"]
    patch.resonance = doc.css("input[name='k10']")[0]["value"]
    patch.env_amt = doc.css("input[name='k11']")[0]["value"]
    patch.brute_factor = doc.css("input[name='k12']")[0]["value"]
    patch.kbd_tracking = doc.css("input[name='k13']")[0]["value"]
    doc.css("script").text[/var prevConnections = (\[.*\])/]
    patch.modmatrix = $1
    patch.octave = doc.css("input[name='octave']")[0]["value"]
    patch.volume = doc.css("input[name='k14']")[0]["value"]
    patch.glide = doc.css("input[name='k15']")[0]["value"]
    patch.mod_wheel = doc.css("input[name='t2']")[0]["value"]
    patch.amount = doc.css("input[name='k16']")[0]["value"]
    patch.wave = doc.css("input[name='t3']")[0]["value"]
    patch.rate = doc.css("input[name='k17']")[0]["value"]
    patch.sync = doc.css("input[name='t4']")[0]["value"]
    patch.env_amt_2 = doc.css("input[name='k18']")[0]["value"]
    patch.vca = doc.css("input[name='t5']")[0]["value"]
    patch.attack = doc.css("input[name='s1']")[0]["value"]
    patch.decay = doc.css("input[name='s2']")[0]["value"]
    patch.sustain = doc.css("input[name='s3']")[0]["value"]
    patch.release = doc.css("input[name='s4']")[0]["value"]
    patch.pattern = doc.css("input[name='k19']")[0]["value"]
    patch.play = doc.css("input[name='t6']")[0]["value"]
    patch.rate_2 = doc.css("input[name='k20']")[0]["value"]

    patch.save
end

