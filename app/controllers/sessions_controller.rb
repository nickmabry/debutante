class SessionsController < ApplicationController
  def create
    auth_user = User.where(github_name: auth_hash.info.nickname).first_or_create(has_voted: false)
    session[:user_id] = auth_user.id
    session[:github_token] = auth_hash.credentials.token
    puts "Auth Hash: #{auth_hash.inspect}"
    redirect_to root_url
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end

  def new
    redirect_to '/auth/twitter'
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
