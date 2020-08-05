class DomainEvent < ApplicationRecord
  def active_support_event
    ActiveSupport::Notifications::Event.new(name, started_at, finished_at, unique_id, data)
  end
end
