module OrdersHelper
    def created_time(order)
      order.created_at.strftime("%A, %b %e at %l:%M %p (UTC)")
    end

    def delivery_date
       delivery_hash = eval(@order.delivery_day)
       "#{delivery_hash[2]}/#{delivery_hash[3]}/#{delivery_hash[1]}"
    end

end
