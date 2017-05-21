class Sale < ApplicationRecord

  before_create :populate_uuid

  belongs_to :item

  validates_numericality_of :price
  greater_than: 49, message: "Price must be at least $0.50"

  private

  def populate_uuid
    self.uuid = SecureRandom.uuid()
  end

end
