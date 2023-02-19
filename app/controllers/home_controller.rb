class HomeController < ApplicationController
  def index
    @users = User.all.reverse
  end
end
