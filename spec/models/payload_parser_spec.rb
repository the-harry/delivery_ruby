# frozen_string_literal: true

require 'rails_helper'

describe PayloadParser do
  let(:input_json) { File.read('spec/fixtures/raw_order.json') }

  let(:expected_costumer) do
    {
      external_code: '136226073',
      name: 'JOHN DOE',
      email: 'john@doe.com',
      contact: '41999999999'
    }
  end

  let(:expected_items) do
    [
      {
        external_code: 'IT4801901403',
        name: 'Produto de Testes',
        price: 49.9,
        quantity: 1,
        total: 49.9,
        sub_items: []
      }
    ]
  end

  let(:expected_payment) do
    [
      {
        type: 'CREDIT_CARD',
        value: 55.04
      }
    ]
  end

  subject { described_class.new(input_json) }

  it 'returns correct external_code' do
    expect(subject.external_code).to eq('9987071')
  end

  it 'returns correct store_id' do
    expect(subject.store_id).to eq(282)
  end

  it 'returns formated sub_total' do
    expect(subject.sub_total).to eq('49.90')
  end

  it 'returns correct delivery_fee' do
    expect(subject.delivery_fee).to eq('5.14')
  end

  it 'returns correct total' do
    expect(subject.total).to eq('55.04')
  end

  it 'returns correct country' do
    expect(subject.country).to eq('BR')
  end

  it 'returns correct state' do
    expect(subject.state).to eq('SP')
  end

  it 'returns correct city' do
    expect(subject.city).to eq('Cidade de Testes')
  end

  it 'returns correct district' do
    expect(subject.district).to eq('Vila de Testes')
  end

  it 'returns correct street' do
    expect(subject.street).to eq('Rua de Testes Fake')
  end

  it 'returns correct complement' do
    expect(subject.complement).to eq('galpao')
  end

  it 'returns correct latitude' do
    expect(subject.latitude).to eq(-23.629037)
  end

  it 'returns correct longitude' do
    expect(subject.longitude).to eq(-46.712689)
  end

  it 'returns correct dt_order_create' do
    expect(subject.dt_order_create).to eq('2019-06-24T16:45:32.000-04:00')
  end

  it 'returns correct postal_code' do
    expect(subject.postal_code).to eq('85045020')
  end

  it 'returns correct number' do
    expect(subject.number).to eq('3454')
  end

  it 'returns costumer data' do
    expect(subject.customer_block).to eq(expected_costumer)
  end

  it 'returns items data' do
    expect(subject.items_block).to eq(expected_items)
  end

  it 'returns payment data' do
    expect(subject.payments_block).to eq(expected_payment)
  end

  it 'returns total shipping' do
    expect(subject.total_shipping).to eq(5.14)
  end
end
