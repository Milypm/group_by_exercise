require 'rails_helper'

RSpec.describe 'exercises', type: :feature do
  let(:user1) { User.create(name: 'Mark', id: 1) }
  let(:user2) { User.create(name: 'Shane', id: 2) }
  let(:exercise1) { Exercise.new(name: 'Running 5km', time: 45, user_id: 1, group_id: 1) }
  let(:exercise2) { Exercise.create(name: 'Yoga', time: 50, user_id: 2) }
  let(:exercise3) { Exercise.create(name: 'Play football', time: 95, user_id: 2, group_id: 1) }
  let(:group) { Group.create(name: 'Cardio-run', icon: 'run-man', id: 1, user_id: 1) }

  def login(user)
    visit '/login'
    fill_in 'Name', with: user.name
    click_button 'Log In'
  end

  context 'views:' do
    it 'shows exercises with a group that belong to current user' do
      user1.save
      group.save
      login(user1)
      visit '/exercises/new'
      fill_in 'Name', with: exercise1.name
      fill_in 'Minutes', with: exercise1.time
      select 'Cardio-run'
      click_button 'Save'
      expect(page).to have_content 'MY EXERCISES'
    end

    it 'shows exercises without a group that belong to current user' do
      user2.save
      login(user2)
      exercise2.save
      exercise3.save
      visit external_exercises_path
      expect(page).to have_content 'MY EXTERNAL EXERCISES'
      expect(page).to have_content exercise2.name
      expect(page).to have_content exercise2.time
    end

    it 'shows the total time of the exercises without a group that belong to current user' do
      user2.save
      login(user2)
      exercise2.save
      exercise3.save
      visit external_exercises_path
      expect(page).to have_content '50 min'
    end
  end
end
