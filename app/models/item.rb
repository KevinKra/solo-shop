class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :price,
                        :image,
                        :inventory

  validates :active,  :inclusion => { :in => [true, false] }
  validates_numericality_of :price, greater_than: 0
  enum gender: ["male", "female", "neutral"]

  def self.all_active
    Item.where(active: true)
  end
end