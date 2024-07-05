require 'rails_helper'

RSpec.describe Credit do
  describe '#initialize' do
    it 'creates an instance of Credit with actors array' do
      data = {
        cast: [
          { name: 'Actor 1', known_for_department: 'Acting' },
          { name: 'Actor 2', known_for_department: 'Directing' },
          { name: 'Actor 3', known_for_department: 'Acting' }
        ]
      }
      credit = Credit.new(data)
      expect(credit.actors).to eq(['Actor 1', 'Actor 3'])
    end
  end
end