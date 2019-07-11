require 'nokogiri'
require 'open-uri'


# class TeamScraper
  @doc = Nokogiri::HTML(open("https://www.mlb.com/team"))

#   def self.teams
    team_pro = []

    teams = @doc.css("div.l-grid__content.l-grid__content--inset")
    
    teams.css("div.p-featured-content__body").each do |team|
      name = team.css("div.u-text-h4.u-text-flow").text
      location = team.css("div.p-featured-content__text").text.strip      #gsub(/\s+/, ' ') 
      team_url = team.css("p").css("a").attribute("href").value
      team_info = {:name => name,
            :location => location,
            :team_url => team_url}
            
            team_pro << team_info
        end
      team_pro
     #end
  
#   def self.team_name
      # names = team_pro.map{|name| name[:name]}
      
      # names
#   end

  # def self.next_game
    # team_site = team_pro.map{|url| url[:team_url]}
    
    # team_site
  # end
  
    # def self.get_schedule
        #team_site.each{|site|
          
       # }
        
    # end
    
    
    date_time = []
    
    schedule = Nokogiri::HTML(open("https://www.mlb.com/orioles")) 
    
    datentime = schedule.css("div.g5-component--mlb-scores__game g5-component--mlb-scores__game--MIG g5-component--mlb-scores__game--Preview")
    datentime.css("div.g5-component--mlb-scores__game-info").each do 
      time = datentime.css("span.g5-component--mlb-scores__date").text
      
      date_time << time
      end
      
    puts date_time
    
    
  
    
    
      
    

# end


