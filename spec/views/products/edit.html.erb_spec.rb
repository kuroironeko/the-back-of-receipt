require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  before(:each) do
    @product =  FactoryBot.create(:product) 
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', user_product_path(user_id: @product.user_id, id: @product.id), 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[number]'
      assert_select 'select[name=?]', 'product[state]'
    end
  end
end
