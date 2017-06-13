class ShippedMailJob < ActiveJob::Base
  queue_as :default

  def perform(order)
    OrderMailer.shipped(order).deliver_now
  end
end
