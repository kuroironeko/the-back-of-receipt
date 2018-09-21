require 'rails_helper'

RSpec.describe 'products_indices/show', type: :view do
  before(:each) do
    @products_index = assign(:products_index, ProductsIndex.create!(
                                                name: 'Name'
                                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
