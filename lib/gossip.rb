require 'csv'

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
    nb = (id.to_i) - 1
    all[nb]
  end

  def self.edit(author, content, id)
    nb = (id.to_i) - 1
    all_gossips = self.all
    all_gossips[nb].author = author
    all_gossips[nb].content = content
    CSV.open('db/gossip.csv', 'w') do |csv| 
      all_gossips.each do |row|
        csv << [row.author,row.content]
      end
    end
  end
end
