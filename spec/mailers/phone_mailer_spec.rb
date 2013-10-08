require "spec_helper"

describe PhoneMailer do
  describe "instructor_help_email" do
    let(:mail) { PhoneMailer.instructor_help_email }

    it "renders the headers" do
      mail.subject.should eq("Instructor help email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
