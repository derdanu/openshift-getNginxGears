#!/usr/bin/env oo-ruby
require "json"
require "resolv"

registry_file = "#{ENV["OPENSHIFT_HOMEDIR"]}gear-registry/gear-registry.json"
nginx_urls = Array.new

file = open(registry_file)
json = file.read
parsed = JSON.parse(json) 

parsed["web"].each do |(key,data)|
	ip = Resolv.getaddress data["proxy_hostname"]
	port = data["proxy_port"]
        nginx_urls << "#{ip}:#{port}"
end

puts nginx_urls.join(",")
