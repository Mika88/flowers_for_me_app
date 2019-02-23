class User < ApplicationRecord
    has_secure_password
    
    has_many :orders
    has_many :arrangements, through: :orders
    
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
end
