class SocietyComment < ApplicationRecord
  belongs_to :user
  belongs_to :society

  validates :comment, presence: true, length: { maximum: 3000 }
end
