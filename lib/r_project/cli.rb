class RuneScapeUpdates::CLI
  def run
    RuneScapeUpdates::Scraper.new.create_articles
    puts "Latest Old School Runescape updates\n"
    start
  end
  
  def start
    puts "Which update would you like to read about? Please select a number\n"
    print_titles
    input = gets.strip
    
    selection = RuneScapeUpdates::Updates.find(input.to_i)
   
    print_article(selection)
    puts "Are you interested in another update summary? Y to read another or N to exit \n"
    
    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts "Bye! Check in again for the latest OSRS update summaries!"
      exit
    else
      puts "Invalid entry please try again"
      start
    end
    
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
    puts "#{selection.description}\n\n"
  end
  
end