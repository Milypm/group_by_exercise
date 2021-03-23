require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.new(name: 'Steve') }
  let(:group) { Group.new(name: 'Cardio', icon: 'some-icon') }

  context 'validation' do
    it 'is valid if it has a name' do
      user.save
      expect(group).to be_valid
    end

    it 'is not valid if name is empty' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'is valid if it has a text icon value' do
      group.save
      expect(group).to be_valid
    end
  end

  context 'association' do
    it 'has many exercises' do
      have_many(:exercises)
    end
  end
end