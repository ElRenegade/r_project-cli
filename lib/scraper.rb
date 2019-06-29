require 'nokogiri'
require 'open-uri'


# class TeamScraper
#   def self.team_names
    team_pro = []
    
    doc = Nokogiri::HTML(open("https://www.mlb.com/team"))
    teams = doc.css("div.l-grid__content.l-grid__content--inset")
    
    teams.css("div.p-featured-content__body").each do |team|
      name = team.css("div.u-text-h4.u-text-flow").text
      location = team.css("div.p-featured-content__text").text.gsub(/\s+/, ' ')
      team_url = team.css("a").attribute("href").value
      team_info = {:name => name,
            :location => location,
            :team_url => team_url}
            
            team_pro << team_info
        end
      puts team_pro
     #end
  
#   def 
    
#   end
# end


