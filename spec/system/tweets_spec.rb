require 'rails_helper'

RSpec.describe "Tweets", type: :system do
  describe '#create' do
    context 'when create a tweet' do
      before do
        login_user
        visit tweets_path
        fill_in 'Comment', with: 'MyText'
        click_on 'Create Tweet'
      end

      it { expect(current_path).to eq(tweets_path) }
      it { expect(page).to have_content('Tweet was successfully created.') }
      it { expect(page).to have_text('MyText') }
    end

    context 'when create and attribute cannot be blank' do
      before do
        login_user
        visit tweets_path
        fill_in 'Comment', with: ''
        click_on 'Create Tweet'
      end

      it { expect(Tweet.new).to_not be_valid }
      it { expect(page).to have_text("Comment can't be blank") }
    end
  end

  describe '#destroy' do
    context 'when can delete the tweet' do
      before do
        login_user
      end

      it 'when the user can only delete their tweets' do
        tweet = create(:tweet, user_id: login_user.id)
        visit tweets_path
        click_on 'Delete'

        expect(current_path).to eq(tweets_path)
        expect(page).to_not have_text(tweet.comment)
      end
    end
  end
end
