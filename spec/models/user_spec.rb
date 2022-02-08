require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.new(
        first_name: 'Michael',
        last_name: 'Dever',
        email: 'mdever@email.com',
        password: '12345',
        password_confirmation: '12345'
      )
    end
    it 'saves a user successfully when all fields are set' do
      @user.save
      expect(@user).to be_valid
    end
    it 'does not save a user when first name is empty' do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
    end
    it 'does not save a user when last name is empty' do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
    end
    it 'does not save a user when email is empty' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
    end
    it 'does not save a user when password is empty' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
    end
    it 'does not save a user when password confirmation is empty' do
      @user.password_confirmation = nil
      @user.save
      expect(@user).to_not be_valid
    end
    it 'does not save a user when password and password confirmation do not match' do
      @user.password_confirmation = '1234'
      @user.save
      expect(@user).to_not be_valid
    end
    it 'does not save a user when password is less than 5 characters' do
      @user.password = '1234'
      @user.password_confirmation = '1234'
      @user.save
      expect(@user).to_not be_valid
    end
  end
  describe ".authenticate_with_credentials" do
    before :all do
      User.create({
        first_name: 'Michael',
        last_name: 'Dever',
        email: 'mdever@email.com',
        password: '12345',
        password_confirmation: '12345'
      })
    end
    it "should authenticate when email and password are correct" do
      expect(User.authenticate_with_credentials('mdever@email.com', '12345')).to_not be_falsy
    end
    it "should not authenticate when email is incorrect" do
      expect(User.authenticate_with_credentials('wrongemail@email.com', '12345')).to be_falsy
    end
    it "should not authenticate when password is incorrect" do
      expect(User.authenticate_with_credentials('mdever@email.com', 'wrongpassword')).to be_falsy
    end
    it "should authenticate when email is the wrong case" do
      expect(User.authenticate_with_credentials('MDEVER@EMAIL.COM', '12345')).to_not be_falsy
    end
    it "should authenticate when email has spaces ath the beginning or end" do
      expect(User.authenticate_with_credentials('   mdever@email.com   ', '12345')).to_not be_falsy
    end
  end
end
