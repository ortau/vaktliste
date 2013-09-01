class SeasonsController < ApplicationController
  def index
    @season = Season.last
    @all_seasons = Season.all
    @users = User.all.sort
    # @season.init_workdays_for_season()
    @workdays = @season.workdays
  end

end
