require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it "is not valid without a password field" do
      user = User.create({
        name: 'donny',
        email: 'donny@donny.com',
        password_confirmation: 'cheese'
      })
      expect(user).to_not be_valid
    end

    it "is not valid without a password_confirmation field" do
      user = User.create({
        name: 'donny',
        email: 'donny@donny.com',
        password: 'cheese'
      })
      expect(user).to_not be_valid
    end

    it "is not valid without a name" do
      user = User.create({
        email: 'donny@donny.com',
        password: 'cheese',
        password_confirmation: 'cheese'
      })
      expect(user).to_not be_valid
    end

    it "has matching password confirmation" do
      user = User.create({
        name: 'donny',
        email: 'donny@donny.com',
        password: 'cheese',
        password_confirmation: 'cheese'
      })
      expect(user.password).to eql(user.password_confirmation)
    end

    it "cannot have matching emails" do
      user1 = User.create({
        name: 'donny',
        email: 'donny@donny.com',
        password: 'cheese',
        password_confirmation: 'cheese'
      })

      user2 = User.create({
        name: 'donny',
        email: 'donny@donny.com',
        password: 'cheese',
        password_confirmation: 'cheese'
      })
      expect(user2).to_not be_valid
    end

    it "is not valid if password is shorter than 3 characters" do
      user = User.create({
        name: 'donny',
        email: 'donny@donny.com',
        password: '1',
        password_confirmation: 'cheese'
      })
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    email = 'donny@donny.com'
    password = '123'
    
    user = User.create({
      name: 'donny',
      email: email,
      password: password,
      password_confirmation: password
    })

    user = User.authenticate_with_credentials(email, password)

    it "returns user if login credentials are correct" do
      expect(user).to_not be_nil
    end


  end

  describe 'password_confirmation' do
    it "it is not valid if password does not match password_confirmation" do
      user = User.create({
        name: 'donny',
        email: 'donny@donny.com',
        password: '123',
        password_confirmation: 'cheese'
      })

      expect(user).to_not be_valid
    end
  end
end