class SeasonsController < ApplicationController
  def index
    @season = Season.last
    @all_seasons = Season.all
    @users = User.all.sort
    @workdays = @season.workdays
  end

  def create_days_for_current_season
    @season = Season.last
    if @season.workdays.nil?
      @season.init_workdays_for_season
    end
    redirect_to index
  end
end
