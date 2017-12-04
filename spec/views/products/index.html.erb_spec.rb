require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :price => "",
        :name => "Name"
      ),
      Product.create!(
        :price => "",
        :name => "Name"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
