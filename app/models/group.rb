class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_many :exercises, foreign_key: 'group_id', class_name: 'Exercise'
  has_many :exercise_creators, foreign_key: 'user_id', class_name: 'Exercise'
end
