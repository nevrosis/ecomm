class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :sales

  has_attached_file :image
  has_attached_file :document

  validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  message: 'Only images allowed'

  validates_attachment :document,
  content_type: { content_type: ["application/pdf", "image/jpeg", "image/gif", "image/png"] },
  message: 'Only pdf allowed'

  validates_numericality_of :price,
  greater_than: 49, message: "Price must be at least $0.50"


end
