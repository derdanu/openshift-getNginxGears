#!/usr/bin/env oo-ruby
require "json"

registry_file =	ENV["OPENSHIFT_HOMEDIR"] + "gear-registry/gear-registry.json"
nginx_urls = Array.new

file = open(registry_file)
json = file.read
parsed = JSON.parse(json)

parsed["web"].each do |(key,data)|
        nginx_urls <<  data["proxy_hostname"] + ":" + data["proxy_port"]
end

puts nginx_urls.join(",")


