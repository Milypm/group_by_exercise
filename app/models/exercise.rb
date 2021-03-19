class Exercise < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true

  belongs_to :user
  belongs_to :group, optional: true
  has_many :groups

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
