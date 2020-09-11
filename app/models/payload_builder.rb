# frozen_string_literal: true

class PayloadBuilder
  attr_reader :data

  def initialize(data)
    @data = PayloadParser.new(data)
  end

  def build!
    camel_case_payload.merge!({ total_shipping: data.total_shipping }).to_json
  end

  def payload
    {
      external_code: data.external_code,
      store_id: data.store_id,
      sub_total: data.sub_total,
      delivery_fee: data.delivery_fee,
      total: data.total,
      country: data.country,
      state: data.state,
      city: data.city,
      district: data.district,
      street: data.street,
      complement: data.complement,
      latitude: data.latitude,
      longitude: data.longitude,
      dt_order_create: data.dt_order_create,
      postal_code: data.postal_code,
      number: data.number,
      customer: data.customer_block,
      items: data.items_block,
      payments: data.payments_block
    }
  end

  private

  def camel_case_payload
    payload.deep_transform_keys! { |key| key.to_s.camelize(:lower) }
  end
end
