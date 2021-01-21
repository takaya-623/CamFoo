class CookImage < ApplicationRecord
  belongs_to :cook
  attachment :image
end
