require 'csv'
require 'pry'

class Gossip 
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    array_gossip = [@author, @content]
    CSV.open("./db/gossip.csv", "a") do |csv|
      csv << array_gossip
    end
  end

  def self.all 
    all_gossips = []
    CSV.foreach("./db/gossip.csv") do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find_by_id(id)
    all[id - 1]
  end
end

#binding.pry