class User < ApplicationRecord
  validates :name, presence: true

  has_many :exercises
  has_many :groups
end
