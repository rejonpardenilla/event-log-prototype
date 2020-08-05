ActiveSupport::Notifications.subscribe(/.command$/) do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  puts event.inspect
end
