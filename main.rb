require 'httparty'
require 'json'

url = 'http://svc.metrotransit.org/NexTrip/11862?format=json'
response = HTTParty.get(url)
data = JSON.parse(response.body)
data.each do |bus|
	if bus['Route'] == "21"
		puts "Bus route 21 will be here in " + bus['DepartureText']
	end
end
