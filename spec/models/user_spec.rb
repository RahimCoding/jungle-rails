require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do 
      @user = User.new(first_name: "test", last_name:"user", email: "test@test.com", password:"123456789", password_confirmation:"123456789")
    end

    it "Name value is present" do
      expect(@user).to be_valid
    end

    it "First name value is not present" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "Last name value is not present" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "User should not be created if passwords dont match" do
      @user.password_confirmation = "seecret"
      expect(@user).to_not be_valid
    end

    it "User should not be created if conformation password is not present" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "No other user can share the same EMAIL" do

      @user2 = User.new(first_name: "test2", last_name:"user2", email: "TEST@TEST.com", password:"secret", password_confirmation:"secret")
      
      @user.save!
      @user2.save

      expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")  
    end

    it "Should contain Email, First and Last name." do

     

      expect(@user).to be_valid
    end

    it "If User doesnt contain Email, First and Last name." do

      

      @user.email = nil
      @user.first_name = nil
      @user.last_name = nil

      expect(@user).to_not be_valid
    end

    it "If password is less than 8 characters, user should not be valid" do

     

      @user.password = "secret"

      expect(@user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
   
    before(:each) do 
      @user = User.create(first_name: "test", last_name:"user", email: "test@test.com", password:"123456789", password_confirmation:"123456789")
    end

    it "User should be valid if email and password is not Nil" do
     user = User.authenticate_with_credentials("test@test.com","123456789")
     expect(user).not_to eq(nil)
    end

    it "User should be not valid if email or password is  Nil" do
      user = User.authenticate_with_credentials(nil,"123456789")
      expect(user).to eq(nil)
     end

     it "User should be not valid if email or password is  Nil" do
      user = User.authenticate_with_credentials("test@test.com", nil)
      expect(user).to eq(nil)
     end

     it "User should be valid if email contains empty sapces" do
      user = User.authenticate_with_credentials("   test@test.com   ", "123456789")
      expect(user).not_to eq(nil)
     end

     it "User should be valid if email contains random captials" do
      user = User.authenticate_with_credentials("tEst@teSt.com", "123456789")
      expect(user).not_to eq(nil)
     end
   
  end



end
