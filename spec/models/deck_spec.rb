# == Schema Information
#
# Table name: decks
#
#  id          :integer          primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#

require 'spec_helper'

describe Deck do
  let(:user) { FactoryGirl.create :user }

  before do
    user.confirm!
    @deck = FactoryGirl.create :deck, user: user
  end

  subject { @deck }

  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :user_id }
  it { should respond_to :user }
  its(:user) { should eq user }

  it { should be_valid }

  describe "validation" do
    context "when user_id is not present" do
      before { @deck = FactoryGirl.build :deck, user: nil }
      it { should_not be_valid }
    end

    context "when title is not present" do
      before { @deck.title = nil }
      it { should_not be_valid }
    end

    context "when title is over 100 caracters" do
      before { @deck.title = "a" * 101 }
      it { should_not be_valid }
    end

    context "when description is over 250 caracters" do
      before { @deck.description = "a" * 251 }
      it { should_not be_valid }
    end
  end
end
