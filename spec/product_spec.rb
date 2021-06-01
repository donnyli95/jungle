require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    described_class.new(
      name: 'anything',
      price_cents: 30,
      quantity: 3,
      category: Category.new
    )
  }

  describe 'Validations' do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid 
    end

    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end
end

# more explicit testing
# p user.errors.full_message
# expect(user.errors.full_messages[0]).to eq("Error Message Here")

# starting with a 'perfect' instance
# before :each do
#   @user = User.new(
#     name: 'cheese',
#     password: 'word'
#   )
# end