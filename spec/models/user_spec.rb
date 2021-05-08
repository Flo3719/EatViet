# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  card_exp_month         :integer
#  card_exp_year          :integer
#  card_last4             :string
#  card_type              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  subscribed             :boolean
#  type                   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  checkout_session_id    :string
#  stripe_id              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.new(email: 'sample@example.com', password: 'password').save
      expect(user).to eq(false)
    end
    it 'ensures username uniqueness' do
      first_user = User.new(username: 'user', email: 'sample@example.com', password: 'password').save
      second_user = User.new(username: 'user', email: 'sample2@example.com', password: 'password').save
      expect(second_user).to eq(false)
    end
    it 'ensures email presence' do
      user = User.new(username: 'user', password: 'password').save
      expect(user).to eq(false)
    end
    it 'should save sucessfully' do
      user = User.new(username: 'user', email: 'sample@example.com', password: 'password').save
      expect(user).to eq(true)
    end
  end

  # context 'scope tests' do
    
  # end
end
