class Order < ApplicationRecord
    belongs_to :user
    belongs_to :arrangement
    
    validates :delivery_day, presence: true
    
    def total_price
      self.arrangement.price * self.quantity
    end
end
