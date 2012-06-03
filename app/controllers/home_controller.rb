class HomeController < ApplicationController
  def index
    if user_signed_in?
      # redirect_to 'candidates#index'
    end
  end
end
