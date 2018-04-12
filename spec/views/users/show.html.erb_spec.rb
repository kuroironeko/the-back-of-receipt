require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyName/)
    expect(rendered).to match(/myemail@myemail.com/)
    expect(rendered).to match(/MyPassword/)
  end
end
