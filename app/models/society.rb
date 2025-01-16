class Society < ApplicationRecord
  has_many :user_societies, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :users, through: :user_societies

  validates :title, presence: true
  validates :introduction, presence: true
  has_one_attached :society_image
  
  def is_owned_by?(user)
    owner.id == user.id
  end
end
