class RuneScapeUpdates::CLI
  def run
    RuneScapeUpdates::Scraper.new.create_articles
    puts "Latest Old School Runescape updates"
    start
  end
  
  def start
    puts "what update would you like to read about"
    print_titles
    
    
    
    
  end
  
  def print_titles
    RuneScapeUpdates::Updates.all.each.with_index do |article, index|
      puts "#{index+1}. #{article.title}"
    end
  end
  
end