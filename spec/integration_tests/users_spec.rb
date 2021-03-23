require 'rails_helper'

RSpec.describe 'users', type: :feature do
  let(:user) { User.create(name: 'Mark') }

  def login(user)
    visit '/login'
    fill_in 'Name', with: user.name
    click_link 'Log In'
  end

  describe 'sign up process' do
    it 'opens new user registration page' do
      visit root_path
      click_button 'SIGN UP'
      page.should have_content 'REGISTER'
    end

    it 'signs me up' do
      visit '/users/new'
      fill_in 'Name', with: user.name
      click_link 'Next'
      page.should have_content 'Mark'
    end
  end

  describe 'edit user-profile process' do
    it 'updates user name' do
      login(user)
      visit edit_user_path(user.id)
      fill_in 'Name', with: 'Marcus'
      click_link 'Next'
      page.should have_content 'Marcus'
    end
  end

  def login(user)
    visit '/login'
    fill_in 'Username', with: user.username
    click_button
  end

  context 'views:' do
    it 'displays events attended by the user on their show page' do
      user.save
      login(user)
      event.save
      attended_event.save
      visit user_path(user)
      expect(page).to have_content event.location
    end
  end

  describe 'Edit user process' do
    it 'updates username' do
      user.save
      login(user)
      visit user_path(user)
      click_link 'Edit User'
      fill_in 'Username', with: user.username
      click_button
      page.should have_content('Username was succesfully updated.')
    end
  end
end
