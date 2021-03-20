class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_many :exercises, dependent: :destroy

  def order_by_name
    @groups = Group.all
    @names = @groups.each { |group| group.map do |g|
      @names.push(g.) }
  end
end
