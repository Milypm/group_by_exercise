class User < ApplicationRecord
  validates :name, presence: true

  has_many :exercises
  has_many :my_exercises, -> { where group_id: !nil }, class_name: 'Exercise'
  has_many :external_exercises, -> { where group_id: nil }, class_name: 'Exercise'
  has_many :groups
end
