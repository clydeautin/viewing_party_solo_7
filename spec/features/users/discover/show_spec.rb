require 'rails_helper'

RSpec.describe 'Discover Show', type: :feature do
  before (:each) do
    @user_1 = User.create!(name: 'Sam', email: 'sam.smith@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy.chan@gmail.com')
    visit "/users/#{@user_1.id}/discover"
  end

  #   As a user,
  # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
  # I should see
  # - a Button to Discover Top Rated Movies
  # - a text field to enter keyword(s) to search by movie title
  # - a Button to Search by Movie Title

  it 'I see a Button to Discover Top Rated Movies' do
    expect(page).to have_link('Discover Top Rated Movies')
  end

  it 'I see a text field to enter keyword(s) to search by movie title' do
    expect(page).to have_field('search')
  end

  it 'I see a Button to Search by Movie Title' do
    expect(page).to have_button('Search by Movie Title')
  end

  it 'allows user to search for movies' do
    sample_json_response = File.read('spec/fixtures/top_rated_movies.json')
  end

  it 'displays top rated movies', :vcr do 
    fill_in :search, with: 'The Lion King'
    click_button 'Search by Movie Title'

    expect(page.status_code).to eq(200)
    expect(page).to have_content('The Lion King')
    expect(page).to have_content('Vote Average of the movie')
    expect(page).to have_button("Discover Page")

  end
end