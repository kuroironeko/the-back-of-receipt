require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(
                                  :product,
                                  name: 'MyProduct',
                                  number: '1',
                                  state: 'request'
                                  ) )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyProduct/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/request/)
  end
end
