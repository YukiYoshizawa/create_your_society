class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

has_many :user_societies, dependent: :destroy
has_many :societies, through: :user_societies
has_many :society_comments, dependent: :destroy
has_many :favorites, dependent: :destroy
has_many :schedules, dependent: :destroy



end
