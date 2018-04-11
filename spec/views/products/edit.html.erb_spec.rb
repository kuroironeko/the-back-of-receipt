require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :number => 1,
      :user => nil
    ))
  end

  it "renders the edit product form" do
    render


    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[number]"

      assert_select "input[name=?]", "product[user_id]"
    end
  end
end
