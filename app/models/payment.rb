# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :order

  alias_attribute :type, :modality

  validates :modality, :value, presence: true
end
