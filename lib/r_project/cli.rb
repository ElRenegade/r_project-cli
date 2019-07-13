class RuneScapeUpdates::CLI
  def run
    RuneScapeUpdates::Scraper.new.create_articles
    puts "Latest Old School Runescape updates"
    start
  end
  
  def start
    puts "what update would you like to read about"
    input = gets.strip.to_i
    
    update_info(input)
    
    puts "What  "
  end
end