class Post < ApplicationRecord

  belongs_to :user
  has_many :post_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  # post_detailsとまとめて登録する
  accepts_nested_attributes_for :post_details, allow_destroy: true

  # いいね中確認メソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 画像を登録可能に
  has_one_attached :post_image

  validates :title, presence: true, length: { minimum: 1, maximum: 20 }
  validates :body, :category, presence: true
  # post_detailsは後から書けるようにバリデーションはつけない

  # 画像の指定がない場合代わりの画像を挿入
  def get_post_image
    if post_image.attached?
      post_image
    else
      ActionController::Base.helpers.asset_path('no_image.jpg')
    end
  end

  enum category: { "日常": 0, "生活の知恵": 1, "遊び": 2, "料理": 3 }

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
end
