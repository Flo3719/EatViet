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
