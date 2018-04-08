class HomeController < ApplicationController
  def index
  end

  def study
    @courses = Course.all
    # @courses = (params[:course].blank?) ? Course.all : Course.where(title: params[:course].split(","))
    # respond_to do |format|
    #   format.html
    #   format.json {
    #     render json: Course.where('title ilike ?', "%#{params[:q]}%").select('*')
    #   }
    # end
  end
end
