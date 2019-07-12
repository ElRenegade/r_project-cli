require 'nokogiri'
require 'open-uri'


# class TeamScraper
  @doc = Nokogiri::HTML(open("https://www.espn.com/mlb/team/_/name/laa/los-angeles-angels"))

#   def self.teams
    team_pro = {}

    teams = @doc.css(".upcoming")
    team_pro[:o_team] = teams.css(".game-info").text
    team_pro[:date] = teams.css(".game-date").text
    team_pro[:time] = teams.css(".time").text
    puts team_pro
    
   
 
  # if team_pro[0].include?("CHICAGO WHITE SOX")
  #   puts "yes"
  # else 
  #   puts "no"
  # end
  
  
# end





