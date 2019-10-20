module OrdersHelper
  def created_time(order)
    order.created_at.strftime("%b %e, %Y at %l:%M %p (UTC)")
  end

  def total_price(order)
    items_price = order.arrangement.price * order.quantity
    case order.delivery_day
    when "in a week - $5"
       items_price + 5
    when "in two days - $10"
       items_price + 10
    else 
       items_price
    end 
  end

  def delivery_date(order)
    case order.delivery_day
    when "in 10 days - free"
      ten_days = order.created_at + 10.day
      ten_days.strftime("%b %e, %Y")
    when "in a week - $5"
      week = order.created_at + 7.day
      week.strftime("%b %e, %Y")
    when "in two days - $10"
      two_days = order.created_at + 2.day
      two_days.strftime("%b %e, %Y")
    end 
  end
end

