require 'pry'
class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications
  def self.first_five
    Boat.all.first(5)
  end

  def self.dinghy
    Boat.where('length < ?', 20)
  end

  def self.ship
    Boat.where('length > ?', 20)
  end

  def self.last_three_alphabetically
    Boat.all.sort_by{|i|i.name}.last(3).reverse
  end

  def self.without_a_captain
    Boat.all.select{|i|i.captain == nil}
  end

  def self.sailboats
    boatsearch("Sailboat")
  end

  def self.boatsearch(bname)
    boatList = []
    Boat.all.each do |boat|
      boat.classifications.all.each do |bclass|
        # binding.pry
        if bclass.name == bname
          boatList << boat
        end
      end
    end
    boatList
  end

  def self.with_three_classifications
    Boat.all.select{|boat| boat.classifications.length > 2}
  end
end

# belongs_to :animal    c== Animal.find(self.animal_id)
# Boat.all.select do|i|
      # i.classification.name == "sailboat"
      # Boat.all.first.boat_classifications.first.classification
      # Boat.all.select do |boat|
      #   boat.boat_classifications.select do |bclass|
      #     bclass.classification.name == "Sailboat"
      #   end
      # end
    # end
    # binding.pry