require "pry"

def build_pigeon_list(data)
# uses gender hash to build pigeon names into the new hash because each name only occurs once in this hash
  pigeon_list = {}
  data[:gender].each { |gender, name_array|
    name_array.each { |name|
      pigeon_list[name] = {
        :color => [],
        :gender => [gender.to_s],
        :lives => [],
      }
    }
  }
  pigeon_list
end

def get_pigeon_colors(data, pigeon_list)
  data[:color].each { |color, name_array| name_array.each { |name| pigeon_list[name][:color] << color.to_s}}
  pigeon_list
end

def get_pigeon_homes(data, pigeon_list)
  data[:lives].each { |home, name_array| name_array.each { |name| pigeon_list[name][:lives] << home}}
  pigeon_list
end

def nyc_pigeon_organizer(data)
  pigeon_list = build_pigeon_list(data)
  get_pigeon_colors(data, pigeon_list)
  get_pigeon_homes(data, pigeon_list)
  pigeon_list
end
