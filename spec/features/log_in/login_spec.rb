require 'rails_helper'
RSpec.feature 'Login', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit user_session_path
    expect(page).to have_content 'Log in'
  end

  it 'user can see inputs and button' do
    visit user_session_path
    expect(page).to have_current_path(user_session_path)
  end

  it 'click the login error' do
    visit user_session_path
    click_button
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'click the login success' do
    User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pass', with: 'password'
    click_button
    expect(page).to have_content 'Categories'
  end

  it 'Login successfully' do
    User.create(name: 'Testing', email: 'user@example.com', password: 'password')
    visit user_session_path
    fill_in 'email', with: 'user@example.com'
    fill_in 'pass', with: 'password'
    click_button
    expect(page).to have_current_path(root_path)
  end
end
