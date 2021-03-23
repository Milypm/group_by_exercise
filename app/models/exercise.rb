class Exercise < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true
  
  belongs_to :user
  belongs_to :group, optional: true
  has_many :groups

  scope :most_recent, -> { order(created_at: :desc) }
  scope :with_group, -> { where.not(group_id: nil) }
  scope :without_group, -> { where(group_id: nil) }
end
