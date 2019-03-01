module OrdersHelper
    def created_time(order)
      order.created_at.strftime("%A, %b %e, at %l:%M %p (UTC)")
    end
end
