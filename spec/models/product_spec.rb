require 'spec_helper'

describe Product do
  before { @product = Product.new(:name => "test_product", :price => 50, :description => "Lorem ipsum.")}

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "product not valid" do

    context "when name is not present" do
      before { @product.name = nil }
      it { should_not be_valid }
    end

    context "when price is not present" do
      before { @product.price = nil }
      it { should_not be_valid }
    end

    context "when description is not present" do
      before { @product.description = nil }
      it { should_not be_valid }
    end

    context "when price is below 0" do
      before { @product.price = -1 }
      it { should_not be_valid }
    end
  end
end
