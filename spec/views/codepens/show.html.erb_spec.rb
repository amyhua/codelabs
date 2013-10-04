require 'spec_helper'

describe "codepens/show.html.erb" do
  before(:each) do
    @codepen = assign(:codepen, stub_model(Codepen,
      :url => "Url",
      :title => "Title",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
