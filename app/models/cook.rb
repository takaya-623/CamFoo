class Cook < ApplicationRecord
  belongs_to :user
  attachment :image

  has_many :materials
  accepts_nested_attributes_for :materials

  validates :name, presence: true
  validates :cooking_time, presence: true, numericality: {only_integer: true}

  enum cook_genre: { meet: 0, fish: 1, vegetables: 2, noodle: 3, rice: 4, soup: 5, other: 6 }
  enum cook_item: { net: 0, plate:1, pan:2, dutch_oven:3, other: 4 }, _prefix: true
end
