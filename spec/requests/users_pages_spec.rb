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

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do
  
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",     with: "Rockefeller"
        fill_in "Email", with: "rockefeller.zq@gmail.com"
        fill_in "Password", with: "44585194"
        fill_in "Confirmation", with: "44585194"
      end
  
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end



