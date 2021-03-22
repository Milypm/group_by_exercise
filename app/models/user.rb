class User < ApplicationRecord
  validates :name, presence: true

  has_many :exercises, dependent: :destroy
  has_many :groups, dependent: :destroy
end
