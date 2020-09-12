# frozen_string_literal: true

require 'rails_helper'

describe PayloadBuilder do
  describe '.build!' do
    let(:good_json) { JSON.parse(File.read('spec/fixtures/raw_order.json')) }
    let(:bad_json) { JSON.parse(File.read('spec/fixtures/raw_order_missing_fields.json')) }

    context 'when it succeeds' do
      let(:expected_json) { File.read('spec/fixtures/processed_order.json') }
      let(:built_json) { described_class.new(good_json).build! }

      it 'returns expect json' do
        expect(JSON.parse(built_json)).to eq(JSON.parse(expected_json))
      end
    end

    context 'when it fails' do
      let(:built_json) { described_class.new(bad_json).build! }

      it 'fill in missing keys with null' do
        expect(built_json).to match(/"complement":null/)
      end
    end
  end
end
