class RunescapeUpdates::Updates
  attr_accessor :title, :description, :date
  
  @@all = []
  
  def self.create_info(scape)
    self.new(
      scape.css(".news-article__title").text,
      #scape.css(".news-article__summary").text.delete_suffix("Read More..."),
      scape.css(".news-article__time").text
      )
  end
  
  def initialize(title, date)
    @title = title
    @description = description
    @date = date
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.article_search(num)
    self.all[num-1]
  end
  
  def get_description
    @description = doc.css(".news-article__summary").text.delete_suffix("Read More...")
  end
  
  def doc
    @doc = Nokogiri::HTML(open("https://oldschool.runescape.com/"))
  end
end







  #def self.title
  #     #puts details.collect { |p| "#{p[:title]}" }
  #   #end
    
  #   #def self.title
  #     # puts details.collect { |p| "#{p[:description]}: #{p[:title]}: #{p[:date]}"}
  #   #end
    
  #   titles = []
  #   details.each do |person|
  #   titles << "#{person[:description]}"
  # end
  
  # puts titles