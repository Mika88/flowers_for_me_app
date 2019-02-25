class Arrangement < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders

    validates :title, presence: true
    validates :title, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true

    mount_uploader :image, ImageUploader
end
