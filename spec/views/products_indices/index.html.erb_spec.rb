require 'rails_helper'

RSpec.describe 'products_indices/index', type: :view do
  before(:each) do
    assign(:products_indices, [
             ProductsIndex.create!(
               name: 'Name'
             ),
             ProductsIndex.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of products_indices' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
