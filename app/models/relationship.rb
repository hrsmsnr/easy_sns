class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # バリデーション
  validates :follower, presence: true
  validates :followed, presence: true
end
