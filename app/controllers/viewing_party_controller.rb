class ViewingPartyController < ApplicationController
  def new
    movie_data = MovieService.get_movie_by_id(params[:movie_id])
    @movie = Movie.new(movie_data)
    @user = User.find(params[:user_id])
  end
  
  def create
    movie_data = MovieService.get_movie_by_id(params[:movie_id])
    @user = User.find(params[:user_id])
    @movie = Movie.new(movie_data)
    @viewing_party = ViewingParty.new(duration: params[:duration], 
                                      date: params[:date], 
                                      start_time: params[:start_time],
                                      movie_runtime: @movie.runtime)
    if @viewing_party.save
      UserParty.create(user: @user, viewing_party: @viewing_party, host: true)
      # require 'pry'; binding.pry
      [params[:guest1], params[:guest2], params[:guest3]].compact_blank.each do |email|
        user_guest = User.find_by(email: email)
        UserParty.create(user: user_guest, viewing_party: @viewing_party, host: false)
      end
      redirect_to user_path(@user), notice: 'Viewing party successfully created.'
    else
      flash.now[:alert] = 'Failed to create party. Please try again.'
      render :new
    end
  end

  private

  def viewing_party_params
    params.require(:viewing_party).permit(:duration, :date, :start_time)
  end

end