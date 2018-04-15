require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:user, 
             FactoryBot.create(
               :user
             )
            )
  end

  it 'renders a list of products' do
    render 
    assert_select 'tr>td', text: 'MyProduct'.to_s, count: 3
    assert_select 'tr>td', text: 'request'.to_s, count: 3
    assert_select 'tr>td', text: 1.to_s, count: 3

  end
end
