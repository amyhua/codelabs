require 'spec_helper'

describe "lessons/edit.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :name => "MyString",
      :description => "MyText",
      :content => "MyText"
    ))
  end

  it "renders the edit lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path(@lesson), :method => "post" do
      assert_select "input#lesson_name", :name => "lesson[name]"
      assert_select "textarea#lesson_description", :name => "lesson[description]"
      assert_select "textarea#lesson_content", :name => "lesson[content]"
    end
  end
end
