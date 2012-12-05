require 'spec_helper'

describe AdminDashboardController do
  context "without an active session" do
    describe "GET 'index'" do
      it "redirects to login page" do
        get 'index'
        response.should redirect_to(new_session_path)
      end
    end
  end

  context "with an active non-admin session" do
    let(:logged_in_user) { FactoryGirl.create(:non_admin) }
    before(:each) do
      User.authenticate( logged_in_user.email, logged_in_user.password)
    end

    describe "GET 'index'" do
      it "redirects to the dashboard page" do
        get :index, {}, { :user_id => logged_in_user.id }
        response.should redirect_to(dashboard_path)
      end
    end
  end

  context "with an active admin session" do
    let(:logged_in_user) { FactoryGirl.create(:admin) }
    before(:each) do
      User.authenticate( logged_in_user.email, logged_in_user.password)
    end

    describe "GET 'index'" do
      it "returns http success" do
        get :index, {}, { :user_id => logged_in_user.id }
        response.should be_success
      end
    end
  end

end
