class RuneScapeUpdates::Run
  def run
    RuneScapeUpdates::Scraper.new.create_articles
    puts "Latest Old School Runescape updates\n\n"
    RuneScapeUpdates::CLI.new.start
  end
end