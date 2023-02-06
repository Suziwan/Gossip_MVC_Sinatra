require 'csv'
require 'pry'

class Gossip 
  attr_reader :author, :content

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
    CSV.foreach("./db/gossip.csv") do |gossip|
      gossip_prov = Gossip.new(gossip[0], gossip[1])
      all_gossips << gossip_prov
    end
    return all_gossips
  end
end

#binding.pry