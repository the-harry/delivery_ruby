# frozen_string_literal: true

require 'rails_helper'

describe ProcessOrderService do
  describe '#connection' do
    it 'returns connection object with ssl' do
      expect(subject.send(:connection).port).to eq(443)
    end
  end

  describe '#request' do
    it 'adds timestamp to header' do
      header = subject.send(:request, {}.to_json).to_hash['x-sent'][0]

      expect(header).to match(%r{\d{2}h\d{2}\s-\s\d{2}/\d{2}/\d{2}})
    end
  end
end
