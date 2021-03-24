# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users', type: :feature do
  let(:user) { User.create(name: 'Mark') }

  def login(user)
    visit '/login'
    fill_in 'Name', with: user.name
    click_button 'Log In'
  end

  describe 'sign up process' do
    it 'opens new user registration page' do
      visit root_path
      click_link 'SIGN UP'
      page.should have_content 'REGISTER'
    end

    it 'signs me up' do
      visit '/users/new'
      fill_in 'Name', with: user.name
      click_button 'Next'
      page.should have_content 'Mark'
    end
  end

  describe 'edit user-profile process' do
    it 'updates user name' do
      login(user)
      visit edit_user_path(user.id)
      fill_in 'Name', with: 'Marcus'
      click_button 'Next'
      page.should have_content 'Marcus'
    end
  end

  describe 'user can be deleted' do
    it 'confirms that user was succesfully deleted' do
      login(user)
      click_link 'Delete User'
      click_button
      page.should have_content 'User was successfully deleted.'
    end
  end
end
