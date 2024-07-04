class ViewingParty < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validate :duration_not_shorter_than_movie_runtime

  attr_accessor :movie_runtime

  def find_host
    users.where("user_parties.host = true").first
  end

  def duration_not_shorter_than_movie_runtime
    return unless duration && movie_runtime

    if duration < movie_runtime
      errors.add(:duration, "can't be shorter than the movie runtime")
    end
  end
end
