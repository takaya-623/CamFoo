class Cook < ApplicationRecord
  belongs_to :user
  attachment :image

  has_many :materials
  accepts_nested_attributes_for :materials
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_cooks, through: :bookmarks, source: :cook

  validates :name, presence: true
  validates :comment, presence: true, length: { in: 13..25 }
  validates :cooking_time, presence: true, numericality: {only_integer: true}
  validates :cook_genre, presence: true
  validates :cook_item, presence: true
  validates :image, presence: true

  enum cook_genre: { meet: 0, fish: 1, vegetables: 2, noodle: 3, rice: 4, soup: 5, other: 6 }
  enum cook_item: { net: 0, plate:1, pan:2, dutch_oven:3, other: 4 }, _prefix: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.ranks
    Cook.find(Like.group(:cook_id).order('count(cook_id) desc').limit(10).pluck(:cook_id))
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

end
