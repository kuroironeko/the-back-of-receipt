require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do 
  before(:each) do
    assign(:products_indices, [
      ProductsIndex.create!(
        :name => "Name0"
      ),
      ProductsIndex.create!(
        :name => "Name1"
      )
    ])
  end
  it 'renders a list of requests' do
    render 
    assert_select 'tr>td', text: "Name0", count: 1

  end
end
