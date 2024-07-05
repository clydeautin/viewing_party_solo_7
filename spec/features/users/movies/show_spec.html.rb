require 'rails_helper'

RSpec.describe 'Movie Show', type: :feature do
  before (:each) do
    @user_1 = User.create!(name: 'Sam', email: 'sam.smith@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy.chan@gmail.com')
  end
  #   As a user, 
  # When I visit a movie's detail page (`/users/:user_id/movies/:movie_id`) where :id is a valid user id,
  # I should see
  # [x] a button to Create a Viewing Party
  # [x] a button to return to the Discover Page

  # I should also see the following information about the movie:

  # [x] Movie Title
  # [x] Vote Average of the movie
  # [x] Runtime in hours & minutes
  # [x] Genre(s) associated to movie
  # [x] Summary description
  # [x] List the first 10 cast members (characters & actress/actors)
  # [x] Count of total reviews
  # [x] Each review's author and information

  it 'shows the movie details', :vcr do
    VCR.use_cassette('spec/fixtures/vcr_cassettes/Movie_Show/shows_the_movie_details.yml') do
      # stub_request(:get, 'https://api.themoviedb.org/3/movies/9732?language=en-US')
      # visit "/users/#{@user_1.id}/discover"
      # fill_in :search, with: 'The Lion King'
      # click_button 'Search by Movie Title'

      # click_link "The Lion King II: Simba's Pride"

      visit user_movie_path(@user_1, 9732)
      # save_and_open_page
      expect(page.status_code).to eq(200)
      expect(page).to have_link("Create a Viewing Party")
      expect(page).to have_content('The Lion King II: Simba\'s Pride')
      expect(page).to have_content('Runtime: 1h 21 mins')
      expect(page).to have_content('Vote Average: 6.9')
      expect(page).to have_content('Genres: Family, Adventure, Animation, Action')
      expect(page).to have_css('.summary')
      expect(page).to have_css('.actor', count: 10)
      expect(page).to have_content('Total Reviews: 1')

      if page.has_css?('.review')
        expect(page).to have_css('.author')
        expect(page).to have_css('.content')
      end
    end
  end

  #   When I visit the new viewing party page ('/users/:user_id/movies/:movie_id/viewing_party/new', where :user_id is a valid user's id and :movie_id is a valid Movie id from the API),
  # I should see the name of the movie title rendered above a form with the following fields:

  # [x] Duration of Party with a default value of movie runtime in minutes; a viewing party should NOT be created if set to a value less than the duration of the movie
  # [x] When: field to select date
  # [x] Start Time: field to select time
  # [x] Guests: three (optional) text fields for guest email addresses 
  # [x] Button to create a party

  it 'can create a new viewing party - Happy Path' do
    visit "/users/#{@user_1.id}/moviews/9732/viewing_party/new"

    expect(page).to have_field('Party Duration:', with: '81')

    fill_in 'date', with: '2024-07-07'
    fill_in 'start_time', with: '11:30'

    expect(page).to have_css('.guests')
    
    click_button 'Create Viewing Party'

    expect(current_path).to eq("/users/#{@user_1.id}")
    expect(page).to have_content('Party Time: 2024-07-07 at 11:30')
  end
end