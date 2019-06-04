class AwardsController < ApplicationController

  def index
    @awards = Award.all
    @award = Award.new
  end

  def show
    @award = Award.find(params[:id])
  end
end
