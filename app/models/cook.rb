class Cook < ApplicationRecord
  belongs_to :user
  has_many :cook_images, dependent: :destroy
  accepts_attachments_for :cook_images, attachment: :image

  enum cook_genre: { meet: 0, fish: 1, vegetables: 2, noodle: 3, rice: 4, soup: 5, other: 6 }
  enum cook_item: { net: 0, plate:1, pan:2, dutch_oven:3, other: 4 }, _prefix: true
end
