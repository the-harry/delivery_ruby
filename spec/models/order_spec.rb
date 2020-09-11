# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:customer) }
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:payments) }
  end
end
