# == Schema Information
#
# Table name: cards
#
#  id                  :integer          not null, primary key
#  front               :text
#  back                :text
#  next_study_datetime :datetime
#  deck_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe Card do
  let(:user) { FactoryGirl.create :user }
  let(:deck) { FactoryGirl.create :deck, user: user }

  before do
    @card = FactoryGirl.build :card, deck: deck
  end

  subject { @card }

  it { should respond_to :front }
  it { should respond_to :back }
  it { should respond_to :next_study_datetime }
  it { should respond_to :deck_id }
  it { should respond_to :deck }
  its(:deck) { should eq deck }

  it { should be_valid }

  describe "validation" do
    context "when deck_id is not present" do
      before { @card = FactoryGirl.build :card, deck: nil }
      it { should_not be_valid }
    end

    context "when front is not present" do
      before { @card.front = nil }
      it { should_not be_valid }
    end

    context "when back is not present" do
      before { @card.back = nil }
      it { should_not be_valid }
    end

    context "when front is over 1000 caracters" do
      before { @card.front = "a" * 1001 }
      it { should_not be_valid }
    end

    context "when back is over 1000 caracters" do
      before { @card.front = "a" * 1001 }
      it { should_not be_valid }
    end
  end
end
