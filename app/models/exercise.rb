class Exercise < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true

  belongs_to :user
  belongs_to :group
end
