require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', user_products_path(user_id: @product.user_id), 'post' do
      assert_select 'select[name=?]', 'product[name]'
      assert_select 'input[name=?]', 'product[number]'
      assert_select 'select[name=?]', 'product[state]'
      assert_select 'select[name=?]', 'product[due_date(1i)]'
      assert_select 'textarea[name=?]', 'product[note]'
      assert_select 'input[name=?]', 'product[price]'
    end
  end
end
