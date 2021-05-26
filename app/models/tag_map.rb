class TagMap < ApplicationRecord
  belongs_to :fashion
  belongs_to :tag

  validates :fashion_id, presence: true
  validates :tag_id, presence: true
end
