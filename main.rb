require 'httparty'
require 'json'

file = File.read('buses.json')
data_hash = JSON.parse(file)
while true do
	data_hash.each do |mystops|
		url = 'http://svc.metrotransit.org/NexTrip/' + mystops['Stop'] + '?format=json'
		response = HTTParty.get(url)
		data = JSON.parse(response.body)
		data.each do |api|
			if (api['Route'] == mystops['Route']) && (api['RouteDirection'] == mystops['RouteDirection'])
				puts 'Bus route ' + api['Route'] + ' going ' + api['RouteDirection'] + ' towards ' + api['Description']  + ' at stop ' + mystops['Stop'] + ': '  + api['DepartureText']
			end
		end
	end
	sleep(30)
end
