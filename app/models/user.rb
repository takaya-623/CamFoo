class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :account_image

  has_many :cooks, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_cooks, through: :bookmarks, source: :cook
  has_many :active_notifications, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  validates :account, uniqueness: true, length: { in: 5..15 }
  enum role: { user: 0, admin: 1 }

  def fullname
    [last_name, first_name].join
  end
end
