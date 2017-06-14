class CartObserver < ActiveRecord::Observer

  def before_destroy(cart)
    cart.line_items.each do |item|
      item.product.increment!(:quantity, item.quantity)
      item.destroy!
    end
  end
end
