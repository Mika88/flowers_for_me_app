class Arrangement < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true

    mount_uploader :image, ImageUploader

    def self.by_price(arrangement_price)
      where(price: arrangement_price)
    end

    def self.by_height(arrangement_height)
      where(height: arrangement_height)
    end
end
