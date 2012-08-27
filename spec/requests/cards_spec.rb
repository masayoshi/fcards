require 'spec_helper'

describe "Cards" do

  subject { page }

  let(:user) { FactoryGirl.create :user }
  let(:deck) { FactoryGirl.create :deck, user: user }
  let(:card) { FactoryGirl.create :card, deck: deck }
  before { user.confirm! }

  describe "Logined user" do
    before { sign_in user }

    context "visit cards index" do
      before { visit deck_cards_path(deck) }
      its(:current_path) { should eq deck_cards_path(deck) }
    end

  end

  describe "Un-logined user" do
    context "visit cards index" do
      before { visit deck_cards_path(deck) }
      its(:current_path) { should eq new_user_session_path }
    end

    context "visit show card page" do
      before { visit deck_card_path(deck, card) }
      its(:current_path) { should eq new_user_session_path }
    end

    context "visit new card page" do
      before { visit new_deck_card_path(deck) }
      its(:current_path) { should eq new_user_session_path }
    end

    context "visit edit card page" do
      before { visit edit_deck_card_path(deck, card) }
      its(:current_path) { should eq new_user_session_path }
    end

    context "submitting a PUT request to the Cards#update action" do
      before { put deck_card_path(deck, card) }
      specify { response.should redirect_to(new_user_session_path) }
    end

    context "submitting a DELETE request to the Cards#destroy action" do
      before { delete deck_card_path(deck, card) }
      specify { response.should redirect_to(new_user_session_path) }
    end
  end
end
