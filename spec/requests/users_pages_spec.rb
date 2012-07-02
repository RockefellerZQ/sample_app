require 'spec_helper'

describe "UsersPages" do
  subject{ page }
  shared_examples_for "all users_pages" do
    it { should have_selector("h1", text: heading) }
    it { should have_selector("title", text: full_title(page_title)) }
  end

  describe "Signup page" do
    before {visit signup_path}
    let(:heading) { "Sign up" }
    let(:page_title) { "Sign up" }
  
    it_should_behave_like "all users_pages"
  end
end
