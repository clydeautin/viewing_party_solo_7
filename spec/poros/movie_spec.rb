require 'rails_helper'

RSpec.describe Movie do
  test_hash =
    {
      title: 'The Shawshank Redemption',
      vote_average: 9.3,
      runtime: 142,
      genres: [
        { name: 'Drama' },
        { name: 'Crime' }
      ],
      overview: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      id: 278
    }

    test_hash_sad =
    {
      title: 'error',
      vote_average: 9.3,
      runtime: nil,
      genres: [
        { name: 'Drama' },
        { name: 'Crime' }
      ],
      overview: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
      id: 278
    }

  movie = Movie.new(test_hash)
  sad_movie = Movie.new(test_hash_sad)

  describe '#initialize' do
    it 'sets the correct attributes' do
      expect(movie.title).to eq('The Shawshank Redemption')
      expect(movie.vote_average).to eq(9.3)
      expect(movie.runtime).to eq(142)
      expect(movie.genres).to eq(['Drama', 'Crime'])
      expect(movie.summary).to eq('Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.')
      expect(movie.id).to eq(278)
    end
  end

  describe '#create_genre_array' do
    context 'when genres_list is nil' do
      it 'returns nil' do
        expect(movie.create_genre_array(nil)).to be_nil
      end
    end

    context 'when genres_list is not nil' do
      it 'returns an array of genre names' do
        genres_list = [
          { name: 'Drama' },
          { name: 'Crime' }
        ]
        expect(movie.create_genre_array(genres_list)).to eq(['Drama', 'Crime'])
      end
    end
  end

  describe '#runtime_in_hours_and_minutes' do
    context 'when runtime is nil' do
      it 'returns 0' do
        expect(sad_movie.runtime_in_hours_and_minutes).to eq(0)
      end
    end

    context 'when runtime is not nil' do
      it 'returns the runtime in hours and minutes format' do
        expect(movie.runtime_in_hours_and_minutes).to eq('2h 22 mins')
      end
    end
  end

  describe '#minutes_to_time' do
    context 'when runtime is nil' do
      it 'returns 0' do
        expect(sad_movie.minutes_to_time).to eq(0)
      end
    end

    context 'when runtime is not nil' do
      it 'returns the runtime as a Time object' do
        expect(movie.minutes_to_time).to eq(Time.parse('2:22'))
      end
    end
  end
end