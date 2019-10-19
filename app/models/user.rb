class User < ApplicationRecord
    has_secure_password
    
    has_many :orders
    has_many :arrangements, through: :orders
    
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :email, email: true

    def self.find_or_create_by_omniauth(auth_hash)
      self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
        user.password = SecureRandom.hex
        user.name = auth_hash["info"]["name"]
        user.uid = auth_hash["uid"]
      end
    end
end
