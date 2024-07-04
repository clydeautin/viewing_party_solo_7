class ViewingPartyController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id]) #test is breaking here ' undefined method `find' for Movie:Class'
    @user = User.find(params[:user_id])
  end

  def create
    party = current_user.parties.create(party_params)
    party.save
    party.invite_guests(params[:friends])
    redirect_to dashboard_path
  end

  private

  def party_params
    params.permit(:movie_id, :duration, :date, :start_time)
  end
end