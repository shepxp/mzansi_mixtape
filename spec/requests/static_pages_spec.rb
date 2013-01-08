require 'spec_helper'

describe "StaticPages" do
  subject { page }
  
  describe "Home page" do
    before { visit "/static_pages/home" }
    
    it "should have h1 'Mzansi Mixtapes' " do
      should have_selector('h1', text: 'Mzansi Mixtapes')
    end
    it "should have correct title" do
      should have_selector('title', text: 'Mzansi Mixtapes | Home')
    end
  end
  
  describe "Help page" do
    before { visit "/static_pages/help" }
    
    it "should have h1 'Help' " do
      should have_selector('h1',text: 'Help')
    end
    it "should have correct title" do
      should have_selector('title', text: 'Mzansi Mixtapes | Help')
    end
  end
  
  describe "About page" do
    before { visit "/static_pages/about" }
    
    it "should have h1 'About us' " do
      should have_selector('h1',text: 'About us')
    end
    it "should have correct title" do
      should have_selector('title', text: 'Mzansi Mixtapes | About us')
    end
  end
  
end
