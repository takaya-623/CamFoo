class Material < ApplicationRecord
  belongs_to :cook
  #posgre使用のため
  default_scope { order(:id) }
end
