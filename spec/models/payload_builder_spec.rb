# frozen_string_literal: true

require 'rails_helper'

describe PayloadBuilder do
  describe '.build!' do
    let(:input_json) { File.read('spec/fixtures/raw_order.json') }
    let(:expected_json) { File.read('spec/fixtures/processed_order.json') }

    it 'returns expect json' do
      built = described_class.new(input_json).build!

      expect(JSON.parse(built)).to eq(JSON.parse(expected_json))
    end
  end
end
