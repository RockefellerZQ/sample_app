require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
    visit '/static_pages/home'
    page.should have_selector('title',
                     :text => "Ruby on Rails tutorail SampleApp | Home")
    end
  end

  describe "Help page" do

    it "should have the h1 'Help'" do
    visit '/static_pages/help'
    page.should have_selector('h1', :text => 'Help')
    end
    
    it "shoule have the title 'Help'" do
    visit '/static_pages/help'
    page.should have_selector('title', 
                   :text => "Ruby on Rails tutorail SampleApp | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About us')
    end
    
    it "shoule have the title 'About us'" do
    visit '/static_pages/about'
    page.should have_selector('title',
               :text => "Ruby on Rails tutorail SampleApp | About us")
    end
  end
end


