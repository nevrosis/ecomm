class Item < ApplicationRecord
  belongs_to :user
  has_attached_file :image
  has_attached_file :document
end
