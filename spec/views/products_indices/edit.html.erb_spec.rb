require 'rails_helper'

RSpec.describe "products_indices/edit", type: :view do
  before(:each) do
    @products_index = assign(:products_index, ProductsIndex.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit products_index form" do
    render

    assert_select "form[action=?][method=?]", products_index_path(@products_index), "post" do

      assert_select "input[name=?]", "products_index[name]"
    end
  end
end
