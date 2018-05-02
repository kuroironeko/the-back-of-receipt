require 'rails_helper'

RSpec.describe "products_indices/new", type: :view do
  before(:each) do
    assign(:products_index, ProductsIndex.new(
      :name => "MyString"
    ))
  end

  it "renders new products_index form" do
    render

    assert_select "form[action=?][method=?]", products_indices_path, "post" do

      assert_select "input[name=?]", "products_index[name]"
    end
  end
end
