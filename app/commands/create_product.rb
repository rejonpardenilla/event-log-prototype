class CreateProduct
  attr_accessor :source_data
  attr_accessor :product

  def initialize(source_data)
    @source_data = source_data
    @product = nil
  end

  def execute
    @product = Product.create!(source_data)

    notify

    product
  end

  private

  def notify
    puts 'notifying'
    # ActiveSupport::Notifications.instrument('CreateProduct', data: source_data)
  end
end
