class TopController < ApplicationController
  def index
    @pets = Pet.includes(:user).order('id DESC').limit(9)
  end
end
