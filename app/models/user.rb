class User < ApplicationRecord
  validates :name, presence: true

  has_many :exercises, dependent: :destroy
  has_many :created_exercises, foreign_key: 'user_id', class_name: 'Exercise', dependent: :destroy
  has_many :groups, dependent: :destroy
end
