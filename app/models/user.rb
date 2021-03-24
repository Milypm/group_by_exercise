# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true

  has_one_attached :user_image
  has_many :exercises, dependent: :destroy
  has_many :groups, dependent: :destroy
end
