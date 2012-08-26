require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.new(:user) }

  it { should respond_to(:email) }
  it { should respond_to(:decks) }
end
