class List < ApplicationRecord
    belongs_to :user
    has_many :basics, -> { order("position ASC") }, dependent: :destroy
    has_many :products, -> { order("position ASC") }, dependent: :destroy

    enum list_type: [:basic, :product]
end
