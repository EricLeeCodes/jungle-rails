require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is not valid to have no first name" do
      user = User.new(
        first_name: nil,
        last_name: "Jones",
        email: "testing@test.com",
        password: "testing123",
        password_confirmation: "testing123"
      )
      expect(user).not_to be_valid
    end
    it "is not valid to have no last name" do
      user = User.new(
        first_name: "Henry",
        last_name: nil,
        email: "testing@test.com",
        password: "testing123",
        password_confirmation: "testing123"
      )
      expect(user).not_to be_valid
    end
    it "is not valid to have no email" do
      user = User.new(
        first_name: "Henry",
        last_name: "Jones",
        email: nil,
        password: "testing123",
        password_confirmation: "testing123"
      )
      expect(user).not_to be_valid
    end
    it "is not valid to have no password" do
      user = User.new(
        first_name: "Henry",
        last_name: "Jones",
        email: "testing@test.com",
        password: nil,
        password_confirmation: "testing123"
      )
      expect(user).not_to be_valid
    end
    it "is not valid to have no password validation" do
      user = User.new(
        first_name: "Henry",
        last_name: "Jones",
        email: "testing@test.com",
        password: "testing123",
        password_confirmation: nil
      )
      expect(user).not_to be_valid
    end
    it "is not valid to have mismatched passwords and password confirmations" do
      user = User.new(
        first_name: "Henry",
        last_name: "Jones",
        email: "testing@test.com",
        password: "testing123",
        password_confirmation: "Testing123"
      )
      expect(user).not_to be_valid
    end
    it "has a minimum password of 8" do
      user = User.new(
        first_name: "Henry",
        last_name: "Jones",
        email: "testing@test.com",
        password: "testing",
        password_confirmation: "testing"
      )
      expect(user).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
  it "returns the user if authentication is successful" do
    user = User.create(
      first_name: "Henry",
      last_name: "Jones",
      email: "testing@test.com",
      password: "testing123",
      password_confirmation: "testing123"
    )
    authenticated_user = User.authenticate_with_credentials("testing@test.com", "testing123")
    expect(authenticated_user).to eq(user)
  end
end

describe 'email validations' do
  it 'downcases email before saving' do
  user = User.create!(
    email: 'TEST@EXAMPLE.COM', 
    password: 'password', 
    password_confirmation: 'password',
    first_name: 'Tester', # Add this line
    last_name: 'TestLastName' # Add this line
  )
  expect(user.reload.email).to eq('test@example.com')
    end
  end

  it 'strips whitespace from email' do
    user = User.create!(
    email: '   test@example.com   ', 
    password: 'password', 
    password_confirmation: 'password',
    first_name: 'Tester', # Add this line
    last_name: 'TestLastName' # Add this line
    )
    expect(user.reload.email).to eq('test@example.com')
  end
end
