class Favorite < ApplicationRecord
  belongs_to :user
  #class_nameはUserで良いのか→×
  belongs_to :micropost

  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
