ActiveSupport::Notifications.subscribe(/.command$/) do |name, started, finished, unique_id, data|
  params = {
    name: name,
    started_at: started,
    finished_at: finished,
    unique_id: unique_id,
    data: data
  }
  DomainEvent.create(params)
end
