require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do 
  let(:products_index) {FactoryBot.create(:products_index)}

  it 'renders a list of requests' do
    render 
    assert_select 'tr>td', text: products_index.name, count: 1

  end
end
