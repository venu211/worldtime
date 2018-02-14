require 'rest-client'
require 'json'
require 'uri'

class Geonames

def get_countries_info
JSON.parse(RestClient.get("http://api.geonames.org/countryInfoJSON?&username=venu2008"))
end

def get_states_info(geonameID)
JSON.parse(RestClient.get("http://api.geonames.org/childrenJSON?geonameId=#{geonameID}&username=venu2008"))
end

def get_wiki_url(country_or_state)
uri = URI.parse(URI.escape("http://api.geonames.org/wikipediaSearchJSON?q=#{country_or_state}&maxRows=1&username=venu2008"))
data = JSON.parse(RestClient.get(uri.to_s))
(data["geonames"].first != nil) ? data["geonames"].first["wikipediaUrl"] : ""
end


end

