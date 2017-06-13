class ReceivedMailJob < ActiveJob::Base
  queue_as :default

  def perform(order)
    OrderMailer.received(order).deliver_now
  end
end
