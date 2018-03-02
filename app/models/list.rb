class List < ApplicationRecord
    belongs_to :user
    has_many :basics, -> { order("position ASC") }
    has_many :products, -> { order("position ASC") }

    before_save { self.list_type ||= :basic }

    enum list_type: [:basic, :product]
end
