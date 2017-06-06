require 'pry-byebug'

# Assumes pigeon_data is in the following format:
#
# pigeon_data = {
#   :color => {
#     :purple => ["Theo", "Peter Jr.", "Lucky"],
#     :grey => ["Theo", "Peter Jr.", "Ms. K"],
#     :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
#     :brown => ["Queenie", "Alex"]
#   },
#   :gender => {
#     :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
#     :female => ["Queenie", "Ms. K"]
#   },
#   :lives => {
#     "Subway" => ["Theo", "Queenie"],
#     "Central Park" => ["Alex", "Ms. K", "Lucky"],
#     "Library" => ["Peter Jr."],
#     "City Hall" => ["Andrew"]
#   }
# }

def get_list_of_pigeon_names(pigeon_data)
	# returns an array with all pigeon names
	pigeon_data[:gender].values.flatten
	# this is how Jeff did it:
	# data.values.map {|hash| hash.values}.flatten.uniq
end

def get_attribute_vals_for_pigeon(pigeon_data, name, key)
	# takes a top-level key for pigeon_data (:color, :gender, or "lives"), the pigeon_data hash, and a pigeon name
	# returns an array of any subkeys that have the pigeon name as one of their values (subkeys are returned as strings)
	pigeon_data[key].select {|attribute, names| names.include?(name)}.keys.map {|key| key.to_s}
end

def nyc_pigeon_organizer(pigeon_data)
	get_list_of_pigeon_names(pigeon_data).each_with_object({}) {|name, hash| 
		hash[name] = {
			:color => get_attribute_vals_for_pigeon(pigeon_data, name, :color),
			:gender => get_attribute_vals_for_pigeon(pigeon_data, name, :gender),
			:lives => get_attribute_vals_for_pigeon(pigeon_data, name, :lives)
		} 
	}
	# call methods to fill in empty arrays
end

# RETURNS LIST WITH THE FOLLOWING FORMAT:
#
# pigeon_list = {
#   "Theo" => {
#     :color => ["purple", "grey"],
#     :gender => ["male"],
#     :lives => ["Subway"]
#   },
#   "Peter Jr." => {
#     :color => ["purple", "grey"],
#     :gender => ["male"],
#     :lives => ["Library"]
#   },
#   "Lucky" => {
#     :color => ["purple"],
#     :gender => ["male"],
#     :lives => ["Central Park"]
#   },
#   "Ms. K" => {
#     :color => ["grey", "white"],
#     :gender => ["female"],
#     :lives => ["Central Park"]
#   },
#   "Queenie" => {
#     :color => ["white", "brown"],
#     :gender => ["female"],
#     :lives => ["Subway"]
#   },
#   "Andrew" => {
#     :color => ["white"],
#     :gender => ["male"],
#     :lives => ["City Hall"]
#   },
#   "Alex" => {
#     :color => ["white", "brown"],
#     :gender => ["male"],
#     :lives => ["Central Park"]
#   }
# }
