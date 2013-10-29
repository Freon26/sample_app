require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home Page at '/'" do
  	get '/'
  	response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact Page at '/contact'" do
  	get '/contact'
  	response.should have_selector('title', :content => "Contact")
  end

it "should have an About Page at '/about'" do
  	get '/about'
  	response.should have_selector('title', :content => "About")
   end

it "should have a Help Page at '/help'" do
  	get '/help'
  	response.should have_selector('title', :content => "Help")
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")    
  end

  it "should have a signin page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => "Sign in")    
  end

  it "should have the right links on the layout" do
    visit root_path
    response.should have_selector('title', :content => "Home")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    visit root_path 
    click_link "Sign up NOW!"
    response.should have_selector('title', :content => "Sign up")
    response.should have_selector('a[href="/"]>img')
  end

  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path, :content => "Sign In")      
    end
  end

  describe "when  signed in" do
    
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit signin_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path, :content => "Sign out")  
    end

    it "should have a profile link" do
       visit root_path
      response.should have_selector("a", :href => user_path(@user), :content => "Profile")  
    end
  end 

end
