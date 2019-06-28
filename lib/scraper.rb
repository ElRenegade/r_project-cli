require 'nokogiri'
require 'open-uri'


#class TeamScraper
 # def self.teams
    html = open("https://www.mlb.com/team")
    doc = Nokogiri::HTML(html)
    teams = doc.css(".p-content-heading__text")
    puts teams
  #end
#end


