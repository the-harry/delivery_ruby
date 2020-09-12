# frozen_string_literal: true

class PayloadParser
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def external_code
    data['id'].to_s
  end

  def store_id
    data['store_id']
  end

  def sub_total
    format('%<total>.2f', total: data['total_amount'])
  rescue TypeError
    nil
  end

  def delivery_fee
    data['total_shipping'].to_s
  end

  def total
    data['total_amount_with_shipping'].to_s
  end

  def country
    data.dig('shipping', 'receiver_address', 'country', 'id')
  end

  def state
    data.dig('shipping', 'receiver_address', 'state', 'id')
  end

  def city
    data.dig('shipping', 'receiver_address', 'city', 'name')
  end

  def district
    data.dig('shipping', 'receiver_address', 'neighborhood', 'name')
  end

  def street
    data.dig('shipping', 'receiver_address', 'street_name')
  end

  def complement
    data.dig('shipping', 'receiver_address', 'comment')
  end

  def latitude
    data.dig('shipping', 'receiver_address', 'latitude')
  end

  def longitude
    data.dig('shipping', 'receiver_address', 'longitude')
  end

  def dt_order_create
    data['date_created']
  end

  def postal_code
    data.dig('shipping', 'receiver_address', 'zip_code')
  end

  def number
    data.dig('shipping', 'receiver_address', 'street_number')
  end

  def customer_block
    buyer = data['buyer']
    buyer_phone = data.dig('buyer', 'phone')

    {
      external_code: buyer['id'].to_s,
      name: buyer['nickname'].to_s,
      email: buyer['email'].to_s,
      contact: "#{buyer_phone['area_code']}#{buyer_phone['number']}"
    }
  rescue NoMethodError
    {}
  end

  def items_block
    data['order_items'].map do |item|
      {
        external_code: item.dig('item', 'id'),
        name: item.dig('item', 'title'),
        price: item['full_unit_price'],
        quantity: item['quantity'],
        total: item['unit_price'].to_f * item['quantity'].to_i,
        sub_items: []
      }
    end
  rescue NoMethodError
    []
  end

  def payments_block
    data['payments'].map do |payment|
      {
        type: payment['payment_type'].upcase,
        value: payment['total_paid_amount']
      }
    end
  rescue NoMethodError
    []
  end

  def total_shipping
    data['total_shipping']
  end
end
