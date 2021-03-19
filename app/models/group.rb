class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_many :exercises, dependent: :destroy
end
