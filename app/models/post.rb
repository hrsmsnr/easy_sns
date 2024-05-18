class Post < ApplicationRecord

  belongs_to :user
  has_many :post_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # いいね中確認メソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 画像を登録可能に
  has_one_attached :post_image

  validates :title, presence: true

  if :category == 0
    validates :body, presence: true, length: {maximum: 200}
  else
    validates :body, presence: true, length: {maximum: 200}
  end
  # 通常の投稿以外では投稿詳細の入力を必須にする
  # unless :category == 0
  #   validates :post_details, presence: true
  # end

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
