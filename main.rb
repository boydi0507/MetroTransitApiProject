require 'httparty'

url = 'http://svc.metrotransit.org/NexTrip/11862?format=json'
response = HTTParty.get(url)
response.parsed_response
puts response
