
class RuneScapeUpdates::Scraper
  def self.open_url
  Nokogiri::HTML(open("https://oldschool.runescape.com/"))
  end

  def self.article_info
    self.open_url.css(".news-article__details")
  end
  
  def self.create_info(scape)
    RuneScapeUpdates::Updates.new(
      scape.css(".news-article__title").text,
      scape.css(".news-article__summary").text.delete_suffix("Read More..."),
      scape.css(".news-article__time").text
      )
  end
  
end


















