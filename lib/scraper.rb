require 'nokogiri'
require 'open-uri'


# class TeamScraper
  @doc = Nokogiri::HTML(open("https://www.mlb.com/team"))

#   def self.teams
    team_pro = []

    teams = @doc.css("div.l-grid__content.l-grid__content--inset")
    
    teams.css("div.p-featured-content__body").each do |team|
      name = team.css("div.u-text-h4.u-text-flow").text
      location = team.css("div.p-featured-content__text").text.gsub(/\s+/, ' ')
      team_url = team.css("a").attribute("href").value
      team_info = {:name => name,
            :location => location,
            :team_url => team_url}
            
            team_pro << team_info
        end
       team_pro
     #end
  
#   def self.team_name
      names = team_pro.map{|name| name[:name]}
      
       names
#   end
  

# end


