require 'rails_helper'

RSpec.describe 'Movie Show', type: :feature do
  before (:each) do
    @user_1 = User.create!(name: 'Sam', email: 'sam.smith@email.com')
    @user_2 = User.create!(name: 'Tommy', email: 'tommy.chan@gmail.com')
  end
  #   As a user, 
  # When I visit a movie's detail page (`/users/:user_id/movies/:movie_id`) where :id is a valid user id,
  # I should see
  # - a button to Create a Viewing Party
  # - a button to return to the Discover Page

  # I should also see the following information about the movie:

  # - Movie Title
  # - Vote Average of the movie
  # - Runtime in hours & minutes
  # - Genre(s) associated to movie
  # - Summary description
  # - List the first 10 cast members (characters & actress/actors)
  # - Count of total reviews
  # - Each review's author and information

  it 'shows the movie details' do
    visit "/users/#{@user_1.id}/discover"
    fill_in :search, with: 'The Lion King'
    click_button 'Search by Movie Title'

    click_link "The Lion King II: Simba's Pride"

    expect(page.status_code).to eq(200)
    expect(page).to have_button("Create a Viewing Party")
    expect(page).to have_content('The Lion King II: Simba\'s Pride')
    expect(page).to have_content('Runtime: 1h 21 mins')
    expect(page).to have_content('Vote Average: 6.945')
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