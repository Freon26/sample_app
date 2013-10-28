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

  it "should have a signinp page at '/signin'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign In")    
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

end
