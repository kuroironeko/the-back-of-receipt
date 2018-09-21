require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(
                                  :product,
                                  name: 'MyProduct',
                                  number: '1',
                                  state: 'request',
                                  due_date: Date.today,
                                  note: 'pikachu',
                                  price: '10000'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyProduct/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/request/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/pikachu/)
    expect(rendered).to match(/10000/)
  end
end
