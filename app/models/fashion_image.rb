class FashionImage < ApplicationRecord
  belongs_to :fashion
  attachment :image
end
