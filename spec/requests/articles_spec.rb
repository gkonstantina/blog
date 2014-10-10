require 'spec_helper'

RSpec.describe "Articles", :type => :request do
  describe "GET /articles" do
    it "should render the main index" do
      get articles_path
      expect(response.status).to be(200)
    end

    it "should render the form to create a new article" do
      user = create(:user)
      post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
      get new_article_path
      expect(response.status).to be(200)
    end
  end
end
