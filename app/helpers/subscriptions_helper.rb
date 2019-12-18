module SubscriptionsHelper
  def have_subscriptions?(event)
    Subscription.where(event: event).present?
  end
end
