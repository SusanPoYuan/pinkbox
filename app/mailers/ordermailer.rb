class Ordermailer < ApplicationMailer

  def notify_order_placed(order)
    @order       = order
    @order_items = @order.items
    @order_info  = @order.info

    mail(to: @order_info.email , subject: "[Pinkbox] 感謝您完成本次的下單，以下是您這次訂單明細信箱")
  end

end
