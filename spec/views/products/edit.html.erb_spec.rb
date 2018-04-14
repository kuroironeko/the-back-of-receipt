require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  before(:each) do
    @product =  FactoryBot.create(:product) 
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', user_product_path(@product), 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[number]'
    end
  end
end
