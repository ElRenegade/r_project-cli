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


















