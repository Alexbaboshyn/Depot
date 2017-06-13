class OrderObserver < ActiveRecord::Observer

  def after_create(order)
    ReceivedMailJob.set(wait: 5.seconds).perform_later(order)
  end

  def after_destroy(order)
    # OrderMailer.shipped(order).deliver_now
    ShippedMailJob.set(wait: 5.seconds).perform_now(order)
  end

end
