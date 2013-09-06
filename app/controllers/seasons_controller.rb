class SeasonsController < ApplicationController
  def index
    @season = Season.last
    @all_seasons = Season.all
    @users = User.all.sort
    if @season.workdays.to_a
      @season.init_workdays_for_season
      @season.save
    end
    @workdays = @season.workdays
  end

end
