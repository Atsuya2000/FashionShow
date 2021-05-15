class FashionComment < ApplicationRecord
  belongs_to :user
  belongs_to :fashion

  validates :comment, presence: true
end
