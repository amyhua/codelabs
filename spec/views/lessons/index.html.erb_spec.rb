require 'spec_helper'

describe "lessons/index.html.erb" do
  before(:each) do
    assign(:lessons, [
      stub_model(Lesson,
        :name => "Name",
        :description => "MyText",
        :content => "MyText"
      ),
      stub_model(Lesson,
        :name => "Name",
        :description => "MyText",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of lessons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
