require 'spec_helper'

describe "Logins" do
  it "redirects non-admins to dashboard upon a valid login attempt" do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Login"
    current_path.should eq(dashboard_path)
    page.should have_content("Welcome")
  end

  it "redirects admins to admin dashboard upon a valid login attempt" do
    user = FactoryGirl.create(:admin)
    visit login_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Login"
    current_path.should eq(admin_dashboard_path)
    page.should have_content("Welcome")
  end

  it "redirects to the login page upon an invalid login attempt" do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in "Email", :with => "not an email address"
    fill_in "Password", :with => user.password
    click_button "Login"
    current_path.should eq(login_path)
    page.should have_content("Sorry")
  end
  # describe "GET /logins" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get logins_path
  #     response.status.should be(200)
  #   end
  # end
end
