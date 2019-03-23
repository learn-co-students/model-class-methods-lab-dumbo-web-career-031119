require "pry"
class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    captainList = []

    Captain.all.each do |capitain|
      capitain.boats.all.each do |boat|
        if boat.classifications.all.any?{|b| b.name == "Catamaran"}
          captainList << capitain
        end
      end
    end
    captainList
  end

  def self.sailors
    capitains = []
    Boat.sailboats.each do |x|
      capitains << x.captain
    end
    capitains.uniq.compact
  end

  def self.talented_seafarers
    capitains = []
    Boat.sailboats.each do |x|
      Boat.boatsearch("Motorboat").each do |y|
        if x.captain == y.captain
          # binding.pry
        capitains << x.captain
        end
      end
    end
    capitains.uniq.compact
  end

  def self.non_sailors
    Captain.all.select do |cap|
      !(sailors.include?(cap))
    end
  end
end




# def self.sailboats
  # boatList = []
  # Boat.all.each do |boat|
    # boat.classifications.all.each do |bclass|
      # if bclass.name == "Sailboat"
        # boatList << boat
      # end
    # end
  # end
  # boatList
# end