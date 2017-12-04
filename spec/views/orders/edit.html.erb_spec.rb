require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :status => "MyString",
      :account_id => 1,
      :total_price => "9.99"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[account_id]"

      assert_select "input[name=?]", "order[total_price]"
    end
  end
end
