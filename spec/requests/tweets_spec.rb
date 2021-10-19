require 'rails_helper'

RSpec.describe "/tweets", type: :request do
  context "GET /index" do
    it "renders a successful response" do
      login_user
      get tweets_path
      expect(response).to have_http_status :ok
    end
  end

  #describe "GET /show" do
  #  it "renders a successful response" do
  #    tweet = Tweet.create! valid_attributes
  #    get tweet_url(tweet)
  #    expect(response).to be_successful
  #  end
  #end
#
  #describe "GET /new" do
  #  it "renders a successful response" do
  #    get new_tweet_url
  #    expect(response).to be_successful
  #  end
  #end
#
  #describe "GET /edit" do
  #  it "render a successful response" do
  #    tweet = Tweet.create! valid_attributes
  #    get edit_tweet_url(tweet)
  #    expect(response).to be_successful
  #  end
  #end

  describe "POST /create" do
    let!(:user) { create(:user) }
    context "with valid parameters" do
      before do
        login_user
      end

      it "creates a new Tweet" do
        valid_attributes = { comment: "MyText", user_id: user.id }
        expect {
          post tweets_url, params: { tweet: valid_attributes }
        }.to change(Tweet, :count).by(1)
      end

      it "redirects to the created tweet" do
        valid_attributes = { comment: "MyText", user_id: user.id }
        post tweets_url, params: { tweet: valid_attributes }
        expect(response).to redirect_to(tweets_path)
      end
    end

    context "with invalid parameters" do
      before do
        login_user
      end

      it "does not create a new Tweet" do
        invalid_attributes = { comment: "", user_id: nil}
        expect {
          post tweets_url, params: { tweet: invalid_attributes }
        }.to change(Tweet, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        invalid_attributes = { comment: "", user_id: nil}
        post tweets_url, params: { tweet: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  #describe "PATCH /update" do
  #  context "with valid parameters" do
  #    let(:new_attributes) {
  #      skip("Add a hash of attributes valid for your model")
  #    }
#
  #    it "updates the requested tweet" do
  #      tweet = Tweet.create! valid_attributes
  #      patch tweet_url(tweet), params: { tweet: new_attributes }
  #      tweet.reload
  #      skip("Add assertions for updated state")
  #    end
#
  #    it "redirects to the tweet" do
  #      tweet = Tweet.create! valid_attributes
  #      patch tweet_url(tweet), params: { tweet: new_attributes }
  #      tweet.reload
  #      expect(response).to redirect_to(tweet_url(tweet))
  #    end
  #  end
#
  #  context "with invalid parameters" do
  #    it "renders a successful response (i.e. to display the 'edit' template)" do
  #      tweet = Tweet.create! valid_attributes
  #      patch tweet_url(tweet), params: { tweet: invalid_attributes }
  #      expect(response).to be_successful
  #    end
  #  end
  #end

  describe "DELETE /destroy" do
    let!(:tweet) { create(:tweet) }

    before do
      login_user
    end

    it "destroys the requested tweet" do
      expect {
        delete tweet_url(tweet)
      }.to change(Tweet, :count).by(-1)
    end

    it "redirects to the tweets list" do
      delete tweet_url(tweet)
      expect(response).to redirect_to(tweets_url)
    end
  end
end
