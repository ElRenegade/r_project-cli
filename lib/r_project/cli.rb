class RuneScapeUpdates::CLI
  # def run
  #   RuneScapeUpdates::Scraper.new.create_articles           ****Moved to run.rb****
  #   puts "Latest Old School Runescape updates\n\n"
  #   start
  # end
  
  def start
    puts "Which update would you like to read about? Please select a number:\n\n"
    print_titles
    print "\nEnter number:"
    input = gets.strip.to_i
    puts ""
    
    if input.between?(1,5)
      selection = RuneScapeUpdates::Updates.find(input.to_i)
    else
      puts "\nINVALID ENTRY PLEASE ENTER A NUMBER FROM THE LIST.\n\n"
      start
    end
   
    print_article(selection)
    
    puts "Are you interested in another update summary? Y to read another or N to exit \n\n"
    
    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts "Bye! Check in again for the latest OSRS update summaries!"
      exit
    else
      puts "\n\nINVALID ENTRY PROGRAM WILL RESET.\n\n"
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
    puts "___________#{selection.date}___________"
    puts "\n_____________Description____________"
    puts ""
    puts "#{selection.description}\n\n"
  end
  
end