class DiscountProductPrice
  attr_accessor :source_data
  attr_accessor :product

  def initialize(product, source_data)
    @product = product
    @source_data = source_data
  end

  def execute
    event_data = { source_data: source_data, entity_id: product&.id }
    ActiveSupport::Notifications.instrument('discount_product_price.command', event_data) do
      @product = product.update!(price: new_price)
    end

    product
  end

  private

  def new_price
    discount = source_data.fetch(:discount)
    product.price - (product.price * discount / 100)
  end
end
