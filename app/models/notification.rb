class Notification < ApplicationRecord
  belongs_to :cook, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  def update_is_checked_and_save
    is_checked = true if visitor_id == visited_id
    save if self.valid?
  end
end
