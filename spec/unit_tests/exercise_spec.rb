require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:user) { User.new(name: 'Steve') }
  let(:exercise) { Exercise.new(name: 'Spinning', time: 45) }

  context 'validation' do
    it 'is valid if it has a name' do
      user.save
      expect(exercise).to be_truthy
    end

    it 'is not valid if name is empty' do
      exercise.name = ''
      expect(exercise).to_not be_valid
    end

    it 'is valid if it has an integer value' do
      user.save
      exercise.save
      expect(exercise).to be_truthy
    end

    it 'is not valid if time is not an integer' do
      exercise.time = 'forty-five minutes'
      expect(exercise).to_not be_valid
    end
  end

  context 'association' do
    it 'has many groups' do
      have_many(:groups)
    end
  end
end
