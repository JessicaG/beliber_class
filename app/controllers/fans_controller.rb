class FansController < ApplicationController
  def index
  end

  def show
    @fan = Fan.find(params[:id])
  end

  def create
    redirect_to fans_path
  end
end
