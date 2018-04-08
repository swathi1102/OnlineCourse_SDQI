class HomeController < ApplicationController
  def index
  end

  def study
    @courses = Course.all
  end
end
