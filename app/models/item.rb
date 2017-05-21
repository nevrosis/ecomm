class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_attached_file :image
  has_attached_file :document

  validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  message: 'Only images allowed'

  validates_attachment :document,
  content_type: { content_type: "application/pdf" },
  message: 'Only pdf allowed'



end
