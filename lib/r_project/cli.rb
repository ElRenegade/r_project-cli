class RuneScapeUpdates::CLI
  def run
    RuneScapeUpdates::Scraper.new.create_articles
    puts "Latest Old School Runescape updates\n"
    start
  end
  
  def start
    puts "what update would you like to read about? Please select a number\n"
    print_titles
    input = gets.strip
    
    selection = RuneScapeUpdates::Updates.find(input.to_i)
   
    print_article(selection)
    
    
  end
  
  def print_titles
    RuneScapeUpdates::Updates.all.each.with_index do |article, index|
      puts "#{index+1}. #{article.title}"
    end
  end
  
  def print_article(selection)
    puts "_____ #{selection.title}_____"
    puts "\n_____________Description____________"
    puts ""
    puts "#{selection.description}"
  end
  
end