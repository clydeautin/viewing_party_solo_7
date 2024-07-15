require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq(new_user_path)

    email = "funbucket13@email.com"
    password = "test"
    password_confirmation = "test"
    name = "Nick Chubb"

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :password_confirmation, with: password_confirmation

    click_on "Create User"

    # save_and_open_page
    expect(page).to have_content("Welcome, #{name}!")
  end

  it "fails to create a new user if data is invalid" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq(new_user_path)

    email = "funbucket13@email"
    password = "test"
    password_confirmation = "byebye"
    name = "Nick Chubb"

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :password_confirmation, with: password_confirmation

    click_on "Create User"

    # save_and_open_page
    expect(page).to_not have_content("Welcome, #{name}!")
  end
end