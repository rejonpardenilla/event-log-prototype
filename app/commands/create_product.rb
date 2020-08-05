class CreateProduct < Command
  after :call, :notify

  def call(data)
    @data = data
    Product.create!(data)
  end

  private

  def notify
    ActiveSupport::Notifications.instrument('CreateProduct', data: @data)
  end
end
