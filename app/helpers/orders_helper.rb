module OrdersHelper
  def created_time(order)
    order.created_at.strftime("%b %e, %Y at %l:%M %p (UTC)")
  end
end

