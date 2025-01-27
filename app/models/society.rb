class Society < ApplicationRecord
  has_many :user_societies, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :users, through: :user_societies
  has_many :society_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :schedules, dependent: :destroy


  validates :title, presence: true
  validates :introduction, presence: true
  has_one_attached :society_image
  
  def is_owned_by?(user)
    owner.id == user.id
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.liked_societies(user) # 1. モデル内での操作を開始
    includes(:favorites) # 2. favorites テーブルを結合
      .where(favorites: { user_id: user.id }) # 3. ユーザーがいいねしたレコードを絞り込み
      .order(created_at: :desc) # 4. 投稿を作成日時の降順でソート
  end

  
end
