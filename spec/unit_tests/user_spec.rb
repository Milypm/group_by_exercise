require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Steve') }

  context 'validation' do
    it 'is valid if there is a name' do
      expect(subject).to be_valid
    end

    it 'is not valid if the name field is empty' do
      subject.name = ''
      expect(subject).to_not be_valid
    end
  end

  context 'association' do
    it 'has many exercises' do
      have_many(:exercises)
    end

    it 'has many groups' do
      have_many(:groups)
    end

    it 'has one attached user image' do
      has_one(:user_image)
    end
  end
end