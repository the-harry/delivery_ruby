# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:contact) }
  end
end
