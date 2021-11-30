class Micropost < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image,   content_type: { in: %w[video/mp4 video],
                                      message: "must be a valid image format" },
                      size:         { less_than: 100.megabytes,
                                      message: "should be less than 5MB" },
                                      presence: true

  has_many :favorites, dependent: :destroy
  has_many :liked_by, through: :favorites, source: :user

  # def display_image
  #   image.variant(resize_to_limit: [500, 500])
  # end
end