class Fashion < ApplicationRecord
  belongs_to :user
  has_many :fashion_images, dependent: :destroy
  accepts_attachments_for :fashion_images, attachment: :image
  has_many :fashion_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :introduction, presence: true
  validate :discount_cannot_be_greater_than_total_value

    def discount_cannot_be_greater_than_total_value
      if fashion_images.size == 0
        # errors.add(:base, "There is not an image")
      end
    end

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    def save_tag(sent_tags)
      current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
      old_tags = current_tags - sent_tags
      new_tags = sent_tags - current_tags

      old_tags.each do |old|
        self.tags.delete Tag.find_by(tag_name: old)
      end

      new_tags.each do |new|
        new_tag = Tag.find_or_create_by(tag_name: new)
        self.tags << new_tag
      end
    end
end
