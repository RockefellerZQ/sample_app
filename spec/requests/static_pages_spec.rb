require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static_pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { "Sample App" }
    let(:page_title) { 'Home' }
  
    it_should_behave_like "all static_pages"
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { "Help" }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static_pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { "About us" }
    let(:page_title) { "About" }

    it_should_behave_like "all static_pages"
  end

  describe "Contact page" do
  before { visit contact_path }
  let(:heading) { "Contact us" }
  let(:page_title) { "Contact" }
 
  it_should_behave_like "all static_pages"
  end
 
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector("title", text: full_title('About Us'))
    click_link 'Help'
    page.should have_selector("title", text: full_title('Help'))
    click_link 'Contact'
    page.should have_selector("title", text: full_title('Contact'))
    click_link 'Home'
    page.should have_selector("title", text: full_title('Home'))
    click_link 'Sign up now!'
    page.should have_selector("title", text: full_title('Sign up'))
    click_link 'sample app'
    page.should have_selector("title", text: full_title('Home'))
  end
end
