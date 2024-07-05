require 'rails_helper'

RSpec.describe Review do
  let(:data) do
    {
      total_results: 3,
      results: [
        { author: 'John Doe', content: 'Great movie!' },
        { author: 'Jane Smith', content: 'Loved it!' },
        { author: 'Bob Johnson', content: 'Not impressed.' }
      ]
    }
  end

  subject { described_class.new(data) }

  describe '#initialize' do
    it 'sets the review count' do
      expect(subject.review_count).to eq(3)
    end

    it 'creates the review author info hash' do
      expect(subject.review_author_info).to eq([
        { author: 'John Doe', content: 'Great movie!' },
        { author: 'Jane Smith', content: 'Loved it!' },
        { author: 'Bob Johnson', content: 'Not impressed.' }
      ])
    end
  end

  describe '#create_review_hash' do
    it 'returns an array of review hashes' do
      result = subject.create_review_hash(data[:results])
      expect(result).to eq([
        { author: 'John Doe', content: 'Great movie!' },
        { author: 'Jane Smith', content: 'Loved it!' },
        { author: 'Bob Johnson', content: 'Not impressed.' }
      ])
    end
  end
end