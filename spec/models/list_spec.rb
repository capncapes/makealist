require 'rails_helper'

RSpec.describe List, type: :model do
	let(:list) { create(:list) }
    
    it { is_expected.to have_many(:basics) }
    it { is_expected.to have_many(:products) }
    it { is_expected.to have_many(:destinations) }

	describe "attributes" do
		it "responds to type" do
			expect(list).to respond_to(:type)
		end

		it "responds to basic?" do
			expect(list).to respond_to(:basic?)
		end

		it "responds to product?" do
			expect(list).to respond_to(:product?)
		end

		it "responds to destination?" do
			expect(list).to respond_to(:destination?)
		end
	end

	describe "types" do
		it "is basic by default" do
			expect(list.type).to eql("basic")
		end

		context "basic list" do
			it "returns true for #basic?" do
				expect(list.basic?).to be_truthy
			end

			it "returns false for #product?" do
				expect(list.product?).to be_falsey
			end

			it "returns false for #destination?" do
				expect(list.destination?).to be_falsey
			end
		end

		context "product list" do
			before do
				list.product!
			end

			it "returns false for #basic?" do
				expect(list.basic?).to be_falsey
			end

			it "returns true for #product?" do
				expect(list.product?).to be_truthy
			end

			it "returns false for #destination?" do
				expect(list.destination?).to be_falsey
			end
		end

		context "destination list" do
			before do
				list.destination!
			end

			it "returns false for #basic?" do
				expect(list.basic?).to be_falsey
			end

			it "returns false for #product?" do
				expect(list.product?).to be_falsey
			end

			it "returns true for #destination?" do
				expect(list.destination?).to be_truthy
			end
		end
	end
end