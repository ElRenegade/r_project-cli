require 'nokogiri'
require 'open-uri'


# class Scraper
    stuff = Nokogiri::HTML(open("https://oldschool.runescape.com/"))

#   def self.teams
      details = []

      stuff.css(".news-article__details").each do |update|
      title = update.css(".news-article__title").text
      description = update.css(".news-article__summary").text.delete_suffix("  Read More...")
      date = update.css(".news-article__time").text
      info = {:title => title,
        :description => description,
        :date => date
      }
      
      details << info
     end
      details
  #end
  
  #def self.title
    #puts details.collect { |p| "#{p[:title]}" }
  #end
  
  #def self.title
    # puts details.collect { |p| "#{p[:description]}: #{p[:title]}: #{p[:date]}"}
  #end
  
  details.each do |person|
  puts "#{person[:title]}"
end
#end