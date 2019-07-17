class RuneScapeUpdates::Updates
  attr_accessor :title, :description, :date
  
  @@all = []
  
  def initialize(title=nil, description=nil, date=nil)                      
    @title = title
    @description = description
    @date = date
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(i)
    self.all[i-1]
  end
  
end







