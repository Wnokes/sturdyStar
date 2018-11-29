class Portfolio < ApplicationRecord
  enum status: { draft: 0, published: 1}
  validates_presence_of :title, :description

  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: :all_blank, allow_destroy: true

  has_many :gallery_items
  accepts_nested_attributes_for :gallery_items, reject_if: :all_blank, allow_destroy: true

  mount_uploader :thumbnail_image, ImageUploader
	mount_uploader :main_image, ImageUploader

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  def self.by_position
    order("position ASC")
  end
end
