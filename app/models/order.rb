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

    def created_time
      self.created_at.strftime("%b %e, %Y at %l:%M %p (UTC)")
    end

    def delivery_date
      case self.delivery_day
      when "in 10 days - free"
        ten_days = self.created_at + 10.day
        ten_days.strftime("%b %e, %Y")
      when "in a week - $5"
        week = self.created_at + 7.day
        week.strftime("%b %e, %Y")
      when "in two days - $10"
        two_days = self.created_at + 2.day
        two_days.strftime("%b %e, %Y")
      end 
    end
end
