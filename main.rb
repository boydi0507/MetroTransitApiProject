require 'httparty'
require 'json'

file = File.read('buses.json')
data_hash = JSON.parse(file)
data_hash.each do |stop|
	url = 'http://svc.metrotransit.org/NexTrip/' + stop['Stop'] + '?format=json'
	response = HTTParty.get(url)
	data = JSON.parse(response.body)
	data.each do |bus|
		if (bus['Route'] == stop['Route']) && (bus['RouteDirection'] == stop['RouteDirection'])
			puts 'Bus route ' + bus['Route'] + ' going ' + bus['RouteDirection'] + ' towards ' + bus['Description']  + ' at stop ' + stop['Stop'] + ': '  + bus['DepartureText']
		end
	end
end
