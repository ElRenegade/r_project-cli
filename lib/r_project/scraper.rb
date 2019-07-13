
class RuneScapeUpdates::Scraper
  def open_url
  Nokogiri::HTML(open("https://oldschool.runescape.com/"))
  end

  def article_info
    self.open_url.css(".news-article__details")
  end
  
  def create_articles
    article_info.each do |article|
      RuneScapeUpdates::Updates.create_info(article)
    end
  end
end
























# #   def self.teams
#       details = []

#       stuff.css(".news-article__details").each do |update|
#       title = update.css(".news-article__title").text
#       description = update.css(".news-article__summary").text.delete_suffix("Read More...")
#       date = update.css(".news-article__time").text
#       info = {:title => title,
#         :description => description,
#         :date => date
#       }
      
#       details << info
#     end
#       details
#   #end