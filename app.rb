require 'yaml'
require 'net/http'
require 'json'

data = YAML.load_file('cv.yml')

uri = URI('https://rubizza.com/register')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri, {'Content-Type' => 'application/json'})
request.body = data.to_json

response = http.request(request)