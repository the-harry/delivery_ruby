# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:modality) }
    it { is_expected.to validate_presence_of(:value) }
  end
end
