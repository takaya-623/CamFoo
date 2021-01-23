class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :account_image

  has_many :cooks, dependent: :destroy
  attachment :image
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_cooks, through: :bookmarks, source: :cook

  validates :account, uniqueness: true

  def fullname
    [last_name, first_name].join
  end
end
