class Fashion < ApplicationRecord
  belongs_to :user
  has_many :fashion_images, dependent: :destroy
  accepts_attachments_for :fashion_images, attachment: :image
  has_many :fashion_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :introduction, presence: true
  validate :discount_cannot_be_greater_than_total_value

    def discount_cannot_be_greater_than_total_value
      if fashion_images.size == 0
        errors.add(:base, "There is not an image")
      end
    end

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
end
