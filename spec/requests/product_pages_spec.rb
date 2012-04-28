require 'spec_helper'

describe "ProductPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    
    it { should have_selector('h1', text: 'Product Listing') }

    describe "create a new product" do

      context "with invalid information" do
        it "should not create a product" do
          expect { click_button "Create" }.should_not change(Product, :count)
        end
      end

      context "with valid information" do
        before do
          fill_in "Product's name", with: "Example Product"
          fill_in 'Price', with: "1"
          fill_in 'Description', with: "Example Description"
        end

        it "should create a product" do
          expect { click_button "Create" }.should change(Product, :count).by(1)
        end
      end
    end

    context "edit a product" do
      let(:product) { FactoryGirl.create(:product) }
      before { visit edit_product_path(product) }

      it { should have_selector('h1', text: 'Edit Product') }

      context "with invalid information" do
        before do
          fill_in 'Price', with: "-1"
          click_button "Update"
        end

        it { should have_css(".error") }
      end

      describe "with valid information" do
        before do
          fill_in "Product's name", with: "Product"
          fill_in 'Price', with: "5"
          fill_in 'Description', with: "Description"
          click_button "Update"
        end

        context "should redirect to home page and update the product" do
          it { should have_selector('h1', text: 'Product Listing') }
          it { should have_selector('h5', text: 'Product') }
        end
      end
    end
  end

end