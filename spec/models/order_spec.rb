# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:customer) }
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:payments) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:external_code) }
    it { is_expected.to validate_presence_of(:store_id) }
    it { is_expected.to validate_presence_of(:sub_total) }
    it { is_expected.to validate_presence_of(:delivery_fee) }
    it { is_expected.to validate_presence_of(:total) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:district) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:dt_order_create) }
    it { is_expected.to validate_presence_of(:postal_code) }
    it { is_expected.to validate_presence_of(:number) }
  end
end
