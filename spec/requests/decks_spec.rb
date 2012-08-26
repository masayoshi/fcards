require 'spec_helper'

describe "Decks" do

  subject { page }

  let(:user) { FactoryGirl.create :user }
  let(:deck) { FactoryGirl.create :deck, user: user }
  before { user.confirm! }

  describe "Logined user" do
    before { sign_in user }

    context "visit decks index" do
      before { visit decks_path }
      its(:current_path) { should eq decks_path }
    end

  end

  describe "Un-logined user" do
    context "visit decks index" do
      before { visit decks_path }
      its(:current_path) { should eq new_user_session_path }
    end

    context "visit show deck page" do
      before { visit deck_path(deck) }
      its(:current_path) { should eq new_user_session_path }
    end

    context "visit new deck page" do
      before { visit new_deck_path }
      its(:current_path) { should eq new_user_session_path }
    end

    context "visit edit deck page" do
      before { visit edit_deck_path(deck) }
      its(:current_path) { should eq new_user_session_path }
    end

    context "submitting a PUT request to the Decks#update action" do
      before { put deck_path(deck) }
      specify { response.should redirect_to(new_user_session_path) }
    end

    context "submitting a DELETE request to the Decks#destroy action" do
      before { delete deck_path(deck) }
      specify { response.should redirect_to(new_user_session_path) }
    end
  end
end
