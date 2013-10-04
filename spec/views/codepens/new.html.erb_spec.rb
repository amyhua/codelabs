require 'spec_helper'

describe "codepens/new.html.erb" do
  before(:each) do
    assign(:codepen, stub_model(Codepen,
      :url => "MyString",
      :title => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new codepen form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => codepens_path, :method => "post" do
      assert_select "input#codepen_url", :name => "codepen[url]"
      assert_select "input#codepen_title", :name => "codepen[title]"
      assert_select "textarea#codepen_note", :name => "codepen[note]"
    end
  end
end
