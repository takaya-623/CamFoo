class Cook < ApplicationRecord
  belongs_to :user
  attachment :image

  has_many :materials
  accepts_nested_attributes_for :materials
  scope :sorted, -> { order(updated_at: :desc) }
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_cooks, through: :bookmarks, source: :cook
  has_many :notifications, dependent: :destroy

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

  #通知作成のために定義
  #いいね
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    already_like_check = Notification.where(["visitor_id = ? and visited_id = ? and cook_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if already_like_check.blank?
      notification = current_user.active_notifications.new(
        cook_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.is_checked = true
      end
      notification.save if notification.valid?
    end
  end
end
