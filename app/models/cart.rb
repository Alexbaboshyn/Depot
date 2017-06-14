class Cart < ApplicationRecord
  has_many :line_items

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    product.decrement(:quantity, 1)
    product.save!
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id, price: product.price)
    end
    current_item
  end
# end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
