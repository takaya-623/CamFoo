class Article < ApplicationRecord
  mount_uploader :article_image, ArticleImageUploader
  enum topic: { cook: 0, goods: 1, beginner: 2 }
end
