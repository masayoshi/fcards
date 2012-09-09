# == Schema Information
#
# Table name: users
#
#  id                     :integer          primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :timestamp
#  remember_created_at    :timestamp
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :timestamp
#  last_sign_in_at        :timestamp
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :timestamp
#  confirmation_sent_at   :timestamp
#  unconfirmed_email      :string(255)
#  created_at             :timestamp        not null
#  updated_at             :timestamp        not null
#

require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.new(:user) }

  it { should respond_to(:email) }
  it { should respond_to(:decks) }
end
