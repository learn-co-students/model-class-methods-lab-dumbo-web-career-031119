require 'pry'
class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    Classification.all
  end

  def self.longest
    Boat.all.sort_by{|boat| boat.length}.last.classifications.all
    # binding.pry
  end
end
