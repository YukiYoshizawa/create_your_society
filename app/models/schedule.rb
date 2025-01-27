class Schedule < ApplicationRecord

  belongs_to :society
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
  
end
