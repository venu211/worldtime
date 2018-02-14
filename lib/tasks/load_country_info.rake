desc "Run this to store all country and state/provision/teritory/region data to database"

task :load_country_and_state_data_to_db => :environment do

puts "Started Loading Data from Geonames API...!\n\n
This could take a while since there are 250 countries and 3890 states for all countries.\n
Please have a cup of coffee and wait for Finished loading message....!\n"


data = Geonames.new.get_countries_info

data["geonames"].each do |country|


	country_wiki = Geonames.new.get_wiki_url(country["countryName"])
	city_wiki    = Geonames.new.get_wiki_url(country["capital"])

Country.create(:name => country["countryName"], :geonameid => country["geonameId"], :capital => country["capital"],
			   :country_wiki => country_wiki, :city_wiki => city_wiki)
end


Country.all.each do |country|
state_data = Geonames.new.get_states_info(country.geonameid)


unless state_data.keys.include?("status")
 state_data["geonames"].each do |state|
 State.create(:country_id => country.id, :name => state["name"])
end
end
end

puts "\nYour wait is over Finished Loading data.\n
May the Force be with you :)"

end