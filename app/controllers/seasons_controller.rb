class SeasonsController < ApplicationController
  def index
    @season = Season.last
    @users = User.all.sort
  end

end
