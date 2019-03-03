class Arrangement < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true

    mount_uploader :image, ImageUploader

    def self.price_asc
      self.order(:price)
    end
    
    def self.price_desc
      self.order(price: :desc)
    end

    def self.by_height(arrangement_height)
      where(height: arrangement_height)
    end
end
