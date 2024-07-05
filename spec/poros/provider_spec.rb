require 'rails_helper'

RSpec.describe Provider do
  describe '#valid?' do
    context 'when all attributes are present' do
      it 'returns true' do
        data = {
          provider_id: 1,
          provider_name: 'Netflix',
          logo_path: '/path/to/logo'
        }
        provider = Provider.new(data)
        expect(provider.valid?).to be true
      end
    end

    context 'when any attribute is missing' do
      it 'returns false' do
        data = {
          provider_id: 1,
          provider_name: nil,
          logo_path: '/path/to/logo'
        }
        provider = Provider.new(data)
        expect(provider.valid?).to be false
      end
    end
  end
end