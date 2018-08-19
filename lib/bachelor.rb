require "pry"

def get_first_name_of_season_winner(data, season)
  winner = (data[season].select { |person| person["status"] == "Winner"})[0]
  winner["name"].split(" ").first
end

def get_contestant_name(data, occupation)
  (data.values.flatten(1).select { |person| person["occupation"] == occupation})[0]["name"]
end

def count_contestants_by_hometown(data, hometown)
  data.values.flatten(1).select { |person| person["hometown"] == hometown}.length
end

def get_occupation(data, hometown)
  data.values.flatten(1).select { |person| person["hometown"] == hometown}[0]["occupation"]
end

def get_average_age_for_season(data, season)
  contestants = data[season].length
  total_age = 0
  data[season].each do |person|
    total_age += person["age"].to_f
  end
  (total_age / contestants).round
end
