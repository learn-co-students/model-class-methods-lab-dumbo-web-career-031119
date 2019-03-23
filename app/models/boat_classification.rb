require 'pry'
class BoatClassification < ActiveRecord::Base
  belongs_to :boat
  belongs_to :classification


  # def self.sailboats
  #   all.select do|i|
  #     binding.pry
  #     # i.classification.name == "sailboat"
  #   end
  # end
end

#  Escape.where(animal_id: self.id)
#  has_many :escapes
#  belongs_to :escapes