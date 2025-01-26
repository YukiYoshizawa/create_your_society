class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :society

  def self.liked_societies(user) # 1. モデル内での操作を開始
    includes(:favorites) # 2. favorites テーブルを結合
      .where(favorites: { user_id: user.id }) # 3. ユーザーがいいねしたレコードを絞り込み
      .order(created_at: :desc) # 4. 投稿を作成日時の降順でソート
  end
end
