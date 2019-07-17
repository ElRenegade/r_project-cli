class RuneScapeUpdates::CLI
  
  def run
    create_articles           
    print_greetings
    start
  end
  
  def start
    print_titles
    print "\nEnter a number:"
    print_article(num_validation)
    puts "Are you interested in another update summary? Y to read another or N to exit \n\n"
    exit_validation
  end
  
  def print_greetings
    puts "\nWelcome, here are the latest Old School Runescape updates\n\n"
    puts "Which update would you like to read about? Please select a number:\n\n"
  end
  
  def create_articles
    RuneScapeUpdates::Scraper.article_info.each do |article|
      RuneScapeUpdates::Scraper.create_info(article)
    end
  end
  
  def num_validation
    input = gets.strip.to_i
    if input.between?(1,RuneScapeUpdates::Updates.all.length)
      selection = RuneScapeUpdates::Updates.find(input.to_i)
    else
      puts "\nINVALID ENTRY PLEASE ENTER A NUMBER FROM THE LIST.\n\n"
      print "Enter number:"
      num_validation
    end
  end
   
  def exit_validation
    input = gets.strip.downcase
    if input == "y"
      puts "\nWhich other update are you interested in?"
      start
    elsif input == "n"
      puts "Check in again for the latest OSRS update summaries!"
      exit
    else
      puts "\n\nINVALID ENTRY, select Y to read another or N to exit .\n\n"
      exit_validation
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