class Order < ApplicationRecord
    belongs_to :user
    belongs_to :arrangement
    
    validates :delivery_day, presence: true
    
    def total_price
      items_price = self.arrangement.price * self.quantity
      case self.delivery_day
      when "in a week - $5"
         items_price + 5
      when "in two days - $10"
         items_price + 10
      else 
         items_price
      end 
    end
end
