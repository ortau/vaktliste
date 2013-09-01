class UserSessionsController < ApplicationController

# app/controllers/user_sessions_controller.rb
  skip_before_filter :require_login, :except => [:destroy]

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:username],params[:password])
        format.html { redirect_back_or_to(:seasons, :notice => 'Du er logga inn.') }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { flash.now[:alert] = "Beklager, feil brukarnamn eller passord."; render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to(:login, :notice => 'Du er no logga ut.')
  end
end
