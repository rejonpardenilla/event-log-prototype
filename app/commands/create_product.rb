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
    ActiveSupport::Notifications.instrument('create_product.command', source_data: source_data, entity_id: product&.id)
  end
end
