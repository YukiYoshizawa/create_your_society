class SocietyComment < ApplicationRecord
  belongs_to :user
  belongs_to :society

  has_one_attached :society_comment_image

  validates :comment, presence: true, length: { maximum: 3000 }

  geocoded_by :address
  after_validation :geocode
end
