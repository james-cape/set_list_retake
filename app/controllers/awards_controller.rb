class AwardsController < ApplicationController

  def index
    @awards = Award.all
    @award = Award.new
  end
end
