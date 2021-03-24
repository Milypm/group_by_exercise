# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'groups', type: :feature do
  let(:user1) { User.create(name: 'Jane', id: 1) }
  let(:user2) { User.create(name: 'Mike', id: 2) }
  let(:exercise1) { Exercise.create(name: 'Running 5km', time: 45, user_id: 1, group_id: 1) }
  let(:exercise2) { Exercise.create(name: 'Running in the park', time: 30, user_id: 1, group_id: 1) }
  let(:group1) { Group.create(name: 'Cardio-run', icon: 'run-man', id: 1, user_id: 1) }
  let(:group2) { Group.new(name: 'Strength', icon: 'weight-lift', id: 2, user_id: 2) }

  def login(user1)
    visit '/login'
    fill_in 'Name', with: user1.name
    click_button 'Log In'
  end

  def login(user2)
    visit '/login'
    fill_in 'Name', with: user2.name
    click_button 'Log In'
  end

  context 'views:' do
    it 'groups/index page shows all the groups that are created' do
      user1.save
      group1.save
      user2.save
      group2.save
      login(user1)
      visit groups_path
      expect(page).to have_content 'Cardio-run'
      expect(page).to have_content 'Strength'
    end
  end

  feature 'displays exercises created by current user and assigned to a group' do
    scenario 'when visiting the group page' do
      user1.save
      group1.save
      exercise1.save
      exercise2.save
      login(user1)
      visit group_path(group1.id)
      expect(page).to have_content 'Running 5km'
      expect(page).to have_content 'Running in the park'
    end
  end
end
