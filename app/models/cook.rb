class Cook < ApplicationRecord
  belongs_to :user
  attachment :image

  has_many :materials
  accepts_nested_attributes_for :materials
  scope :sorted, -> { order(updated_at: :desc) }
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_cooks, through: :bookmarks, source: :user
  has_many :notifications, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :comment
    validates :cooking_time
    validates :cook_genre
    validates :cook_item
    validates :image
    validates :cooking_method
  end
  validates :cooking_time, presence: true, numericality: { only_integer: true }

  enum cook_genre: { meet: 0, fish: 1, vegetables: 2, noodle: 3, rice: 4, soup: 5, other: 6 }
  enum cook_item: { net: 0, plate: 1, pan: 2, dutch_oven: 3, pot: 4, other: 5 }, _prefix: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.ranks
    find(Like.group(:cook_id).order(Arel.sql('count(cook_id) desc')).limit(9).pluck(:cook_id))
  end

  def self.last_week
    # 料理テーブルといいねテーブルを結合し、特定期間のいいねがついた料理を取得。
    today = Time.current
    joins(:likes).where(
      likes: { created_at: today.prev_week..today.prev_week(:sunday) }
    ).group(:id).order("count(*) desc").limit(9)
  end

  def self.ranks_top
    find(Like.group(:cook_id).order(Arel.sql('count(cook_id) desc')).limit(3).pluck(:cook_id))
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  # 通知作成のために定義
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    already_like_check = Notification.where(
      [
        "visitor_id = ? and visited_id = ? and cook_id = ? and action = ? ",
        current_user.id, user_id, id, 'like',
      ]
    )
    # いいねされていない場合のみ、通知レコードを作成
    return unless already_like_check.blank?
    notification = current_user.active_notifications.new(
      cook_id: id,
      visited_id: user_id,
      action: 'like'
    )
    notification.update_is_checked_and_save # Notificationモデルに定義
  end
end
