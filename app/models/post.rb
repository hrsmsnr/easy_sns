class Post < ApplicationRecord

  belongs_to :user
  has_many :post_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # post_detailsとまとめて登録する
  accepts_nested_attributes_for :post_details, allow_destroy: true

  # いいね中確認メソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 画像を登録可能に
  has_one_attached :post_image

  validates :title, :body, :category, presence: true
  # post_detailsは後から書けるようにバリデーションはつけない

  # 画像の指定がない場合代わりの画像を挿入
  def get_post_image
    unless (post_image.attached?)
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end

  enum category: { "通常": 0, "生活の知恵": 1, "遊び": 2, "料理": 3 }
end
