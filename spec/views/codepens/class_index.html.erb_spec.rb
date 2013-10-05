require 'spec_helper'

describe "codepens/index.html.erb" do
  before(:each) do
    assign(:codepens, [
      stub_model(Codepen,
        :url => "Url",
        :title => "Title",
        :note => "MyText"
      ),
      stub_model(Codepen,
        :url => "Url",
        :title => "Title",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of codepens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
